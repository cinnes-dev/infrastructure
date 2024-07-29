provider "google" {
  project = "cinnes-dev-id"
  region = var.region
  user_project_override = true
}

data "google_client_config" "google_config" {

}

resource "google_project_service" "iam_api" {
  project = google_project.default.id
  service = "iam.googleapis.com"
}