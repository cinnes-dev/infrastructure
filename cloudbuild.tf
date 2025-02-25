resource "google_project_service" "cloud_build_api" {
  project = google_project.default.id
  service = "cloudbuild.googleapis.com"
}

resource "google_service_account" "cloudbuild_sa" {
  account_id = "cloud-sa"
  display_name = "Cloudbuild SA"

  depends_on = [
    google_project_service.iam_api
  ]
}

resource "google_project_iam_member" "cloud_deployer" {
  for_each = toset([
    "roles/iam.serviceAccountUser",
    "roles/logging.logWriter",
    "roles/storage.admin",
    "roles/artifactregistry.admin",
    "roles/run.admin",
    "roles/secretmanager.secretAccessor"
  ])

  project = google_project.default.id
  role = each.key
  member = "serviceAccount:${google_service_account.cloudbuild_sa.email}"
}

resource "google_cloudbuild_trigger" "github_master_trigger" {
  name = "platform-deploy-trigger"
  github {
    owner = var.github-owner
    name = var.platform-repo-name
    push {
      branch = var.platform-main-branch
    }
  }

  service_account = google_service_account.cloudbuild_sa.id
  filename        = "ci/deploy.yaml"
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  depends_on = [
    google_project_iam_member.cloud_deployer,
    google_project_service.cloud_build_api
  ]
}
