resource "google_cloud_run_service" "cr-instance" {
  name     = "cloudrun-service"
  location = var.region
  

  template {
    spec {
        containers {
            image = "us-docker.pkg.dev/cloudrun/container/hello"
        }
    }
  }
}