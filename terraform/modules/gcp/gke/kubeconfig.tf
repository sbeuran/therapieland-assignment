locals {
  kubeconfig = {
    apiVersion = "v1"
    kind = "Config"
    preferences = {
      colors = true
    }
    current-context = google_container_cluster.therapieland-gke-cluster.name
    contexts = [
      {
        name = google_container_cluster.therapieland-gke-cluster.name
        context = {
          cluster = google_container_cluster.therapieland-gke-cluster.name
          user = var.service-account-email
          namespace = "default"
        }
      }
    ]
    clusters = [
      {
        name = google_container_cluster.therapieland-gke-cluster.name
        cluster = {
          server = "https://${google_container_cluster.therapieland-gke-cluster.endpoint}"
          certificate-authority-data = google_container_cluster.therapieland-gke-cluster.master_auth[0].cluster_ca_certificate
        }
      }
    ]
    users = [
      {
        name = var.service-account-email
        user = {
          exec = {
            apiVersion = "client.authentication.k8s.io/v1beta1"
            command = "gke-gcloud-auth-plugin"
            interactiveMode = "Never"
            provideClusterInfo = true
          }
        }
      }
    ]
  }
}