resource "google_monitoring_notification_channel" "email" {
  display_name = "Test Notification Channel"
  type         = "email"
  labels = {
    email_address = "juanluiscc@gmail.com"
  }
}