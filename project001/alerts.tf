resource "google_monitoring_alert_policy" "cr_slo_uptime_checks_alert" {
  project               = var.project  
  enabled               = true
  
  
  combiner = "OR"
  conditions {
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = "0s"
      filter          = "select_slo_burn_rate(\"projects/${var.project}/services/cr-service-id/serviceLevelObjectives/cr-uptime-check-slo\", \"3600s\")"
      threshold_value = 1
      trigger {
        count = 1
      }
    }
    display_name = "Alerta CR SLO uptime checks"
  }
  display_name = "Alerta CR SLO uptime checks"
  documentation {
    content   = "Documentacion va aqui"
    mime_type = "text/markdown"
  }
}

resource "google_monitoring_alert_policy" "cr_slo_latencies_alert" {
  project               = var.project  
  enabled               = true
  
  
  combiner = "OR"
  conditions {
    condition_threshold {
      comparison      = "COMPARISON_GT"
      duration        = "0s"
      filter          = "select_slo_burn_rate(\"projects/${var.project}/services/cr-service-id/serviceLevelObjectives/cr-latencies-slo\", \"3600s\")"
      threshold_value = 1
      trigger {
        count = 1
      }
    }
    display_name = "Alerta CR SLO latencies"
  }
  display_name = "Alerta CR SLO latencies"
  documentation {
    content   = "Documentacion va aqui"
    mime_type = "text/markdown"
  }
}