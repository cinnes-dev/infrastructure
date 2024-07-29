resource "google_project_service" "cloud_storage_api" {
  project = google_project.default.id
  service = "storage.googleapis.com"
}

resource "google_project_service" "service_usage_api" {
  project = google_project.default.id
  service = "serviceusage.googleapis.com"
}

resource "google_storage_bucket" "cloudbuild_logs" {
  # Unique across all cloud storage users
  name     = "cinnes-dev-platform-cloudbuild-logs"
  location = "EU"
  force_destroy = true
  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "build_cache" {
  # Unique across all cloud storage users
  name     = "cinnes-dev-build-cache"
  location = "EU"
  force_destroy = true
  public_access_prevention = "enforced"
}