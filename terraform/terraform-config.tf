terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
  backend "local" {
    path = "./tf.statefile.json"
  }
}