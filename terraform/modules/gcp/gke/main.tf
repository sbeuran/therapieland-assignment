resource "google_container_cluster" "therapieland-gke-cluster" {
  name = "therapieland-gke-cluster"
  project = var.project

  location = var.region
  node_locations = var.k8s-node-locations

  initial_node_count = 1
  
  network    = var.therapieland-vpc-name
  subnetwork = var.therapieland-vpc-gke-subnet-01-name

  deletion_protection = false

  node_config {
    service_account = var.service-account-email

    machine_type = var.gke-node-tier
  }
}