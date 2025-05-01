resource "google_storage_bucket" "bucket-files" {
  name          = "bucket-files-cultivated-age-310108"
  location      = var.region
  force_destroy = true
}