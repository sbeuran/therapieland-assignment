output "kubeconfig" {
  value = module.gke.therapieland-k8s-cluster-kubeconfig
  sensitive = true
}

output "therapieland-db-host" {
  value = module.database.db-host
}