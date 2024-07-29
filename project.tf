resource "google_project_service" "cloud_resource_manager" {
  project = google_project.default.id
  service = "cloudresourcemanager.googleapis.com"
}


import {
  id = "cinnes-dev-id"
  to = google_project.default
}

resource "google_project" "default" {
  name       = "cinnes-dev"
  project_id = "cinnes-dev-id"
}