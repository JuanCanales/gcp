resource "google_monitoring_custom_service" "cr_service" {
  service_id = "cr-service-id"
  display_name = "CR Monitoring Custom Service"
}

resource "google_monitoring_slo" "cr_slo_uptime_checks" {
  service = google_monitoring_custom_service.cr_service.service_id
  slo_id = "cr-uptime-check-slo"
  display_name = "CR - SLO - Uptime checks ratio (90% uptime checks in a window time of 1h over 30d are Ok)"

  goal = 0.9
  rolling_period_days = 30


  windows_based_sli {
    window_period = "3600s"     # 1h
    good_bad_metric_filter =  join(" AND ", [
      "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\"",
      "resource.type=\"cloud_run_revision\"",
    ])
   }
}

resource "google_monitoring_slo" "cr_slo_latencies" {
  service = google_monitoring_custom_service.cr_service.service_id
  slo_id = "cr-latencies-slo"
  display_name = "CR - SLO - Latencies ratio (90% requests in a window time of 1h over 30d are less than 5seg)"

  goal = 0.9
  rolling_period_days = 30

  windows_based_sli {
    window_period = "3600s" # 1h
    metric_sum_in_range {
      time_series = join(" AND ", [
        "metric.type=\"monitoring.googleapis.com/uptime_check/request_latency\"",
        "resource.type=\"uptime_url\"",
      ])

      range {
        max = 5000  # 5s
      }
    }
  }
}

  /*
  request_based_sli {
    distribution_cut {
          distribution_filter = "metric.type=\"monitoring.googleapis.com/uptime_check/request_latency\" resource.type=\"cloud_run_revision\"  "
          range {
            max = 3000
          }
        }
  }
  */
