output "kubeconfig" {
  value = module.gke.therapieland-k8s-cluster-kubeconfig
  sensitive = true
}