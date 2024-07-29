resource "google_project_service" "artifactregistry_api" {
  project = google_project.default.id
  service = "secretmanager.googleapis.com"
}

resource "google_secret_manager_secret" "health-ingest-key" {
  secret_id = "health-ingest-key"
  project = google_project.default.id

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret" "sentry-auth-token" {
  secret_id = "sentry-auth-token"
  project = google_project.default.id

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret" "influx-token" {
  secret_id = "influx-token"
  project = google_project.default.id

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}
