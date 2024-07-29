provider "google" {
  project = "cinnes-dev-id"
  region = var.region
  user_project_override = true
}

data "google_client_config" "google_config" {

}

resource "google_project_service" "cloud_resource_manager" {
  project = data.google_client_config.google_config.id
  service = "cloudresourcemanager.googleapis.com"
}