output "therapieland-k8s-cluster-endpoint" {
  value = google_container_cluster.therapieland-gke-cluster.endpoint
}

output "therapieland-k8s-cluster-ca-certificate" {
  value = google_container_cluster.therapieland-gke-cluster.master_auth.0.cluster_ca_certificate
}

output "therapieland-k8s-cluster-client-certificate" {
  value = google_container_cluster.therapieland-gke-cluster.master_auth.0.client_certificate
}

output "therapieland-k8s-cluster-client-key" {
  value = google_container_cluster.therapieland-gke-cluster.master_auth.0.client_key
}

output "therapieland-k8s-cluster-kubeconfig" {
  value = yamlencode(local.kubeconfig)
  sensitive = true
}

