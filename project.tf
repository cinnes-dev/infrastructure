import {
  id = "cinnes-dev-id"
  to = google_project.default
}

resource "google_project" "default" {
  name       = "cinnes-dev"
  project_id = "cinnes-dev-id"
}