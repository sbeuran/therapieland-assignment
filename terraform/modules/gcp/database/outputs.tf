output "db-url" {
  value = google_sql_database_instance.therapieland-db.public_ip_address
}