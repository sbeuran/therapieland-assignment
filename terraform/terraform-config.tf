terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.33.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.14.0"
    }
  }
  backend "local" {
    path = "./tf.statefile.json"
  }
}