  
resource "google_project_service" "api-iam" {
  project = var.project
  service = "iam.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_on_destroy = true
}

resource "google_project_service" "api-cloudrun" {
  project = var.project
  service = "run.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_on_destroy = true
}


resource "google_project_service" "api-storage" {
  project = var.project
  service = "storage.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_on_destroy = true
}
