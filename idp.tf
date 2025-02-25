resource "google_project_service" "identitytoolkit_api" {
  project = google_project.default.id
  service = "identitytoolkit.googleapis.com"
}

resource "google_identity_platform_config" "default" {
  project = google_project.default.id
  autodelete_anonymous_users = true
  sign_in {
    allow_duplicate_emails = false

    anonymous {
      enabled = false
    }
    email {
      enabled = false
      password_required = true
    }
  }
#   blocking_functions {
#     triggers {
#       event_type   = "beforeSignIn"
#       function_uri = "https://${var.domain-name}/before-sign-in"
#     }
#     forward_inbound_credentials {
#       refresh_token = true
#       access_token = true
#       id_token = true
#     }
#   }
#   quota {
#     sign_up_quota_config {
#       quota = 1000
#       start_time = ""
#       quota_duration = "7200s"
#     }
#   }
  authorized_domains = [
    "localhost",
    var.domain-name
  ]

  depends_on = [
    google_project_service.identitytoolkit_api
  ]
}

# resource "google_identity_platform_default_supported_idp_config" "idp_config" {
#   enabled       = true
#   idp_id        = "google.com"
#
#   client_id     = var.idp_client_id
#   client_secret = var.idp_client_secret
# }