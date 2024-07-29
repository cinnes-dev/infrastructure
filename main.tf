provider "google" {
  project = "cinnes-dev-id"
  region = var.region
  user_project_override = true
}

resource "google_project_service" "cloud_resource_manager" {
  project = google_project.default.id
  service = "cloudresourcemanager.googleapis.com"
}