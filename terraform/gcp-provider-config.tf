data "google_client_config" "current" {}

provider "google" {
  project = var.gcp-project-name
  region      = var.gcp-project-region
  credentials = var.gcp-terraform-credentials-file-location
}