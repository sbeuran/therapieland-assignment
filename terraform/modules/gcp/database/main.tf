resource "google_sql_database_instance" "therapieland-db" {
  name             = "therapieland-db"
  database_version = var.db-instance-database-version
  region           = var.region
  project          = var.project

  root_password = var.db-instance-root-password

  depends_on = [ var.therapieland-db-google-service-networking-connection-id ]

  deletion_protection = false
  
  settings {
    tier = var.db-instance-tier
    
    ip_configuration {
      ipv4_enabled = false
      private_network = var.db-instance-network-self-link
      require_ssl = true
    }
  }
}