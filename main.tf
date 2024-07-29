provider "google" {
  project = "cinnes-dev-id"
  region = var.region
  user_project_override = true
}

data "google_client_config" "google_config" {

}