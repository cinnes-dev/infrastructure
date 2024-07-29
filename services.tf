resource "google_project_service" "identitytoolkit" {
  project = google_project.cinnes_dev_project
  service = "identitytoolkit.googleapis.com"
}