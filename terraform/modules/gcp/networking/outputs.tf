output "therapieland-vpc-name" {
  value = google_compute_network.therapieland-vpc.name
}

output "therapieland-vpc-network-self-link" {
  value = google_compute_network.therapieland-vpc.self_link
}

output "therapieland-vpc-gke-subnet-01-name" {
  value = google_compute_subnetwork.therapieland-vpc-gke-subnet-01.name
}

output "therapieland-db-google-service-networking-connection-id" {
  value = google_service_networking_connection.private_vpc_connection.id
}