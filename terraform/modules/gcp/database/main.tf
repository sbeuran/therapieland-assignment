resource "google_sql_database_instance" "therapieland-db" {
  name             = "therapieland-db"
  database_version = var.db-instance-database-version
  region           = var.region
  project          = var.project

  depends_on = [ var.therapieland-db-google-service-networking-connection-id ]
  
  deletion_protection = false
  
  settings {
    tier = var.db-instance-tier
    
    ip_configuration {
      ipv4_enabled = false
      private_network = var.db-instance-network-self-link
    }
  }
}

resource "google_sql_database" "database" {
  name     = var.db-name
  instance = google_sql_database_instance.therapieland-db.name
}

resource "google_sql_user" "users" {
  name     = var.db-instance-user
  instance = google_sql_database_instance.therapieland-db.name
  password = var.db-instance-password
}