resource "google_compute_network" "therapieland-vpc" {
  name = "therapieland-vpc"
  project = var.project

  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "therapieland-vpc-gke-subnet-01" {
  name = "therapieland-vpc-gke-subnet-01"
  project = var.project

  ip_cidr_range = var.therapieland-vpc-gke-subnet-01-cidr
  region = var.region

  network = google_compute_network.therapieland-vpc.id
}

resource "google_compute_global_address" "private_ip_address" {
  name = "therapieland-db-private-ip-address"
  purpose = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network = google_compute_network.therapieland-vpc.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network = google_compute_network.therapieland-vpc.id
  service = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [ google_compute_global_address.private_ip_address.name ]
}