output "sql_instance_name" {
  description = "The name of the SQL instance"
  value       = google_sql_database_instance.sql.name
}

output "self_link" {
  description = "The URI of the created sql instance"
  value       = google_sql_database_instance.sql.self_link
}

output "instance_ip_address" {
  description = "The IPv4 address of the SQL instance"
  value       = google_sql_database_instance.sql.ip_address.0.ip_address
}

output "sql_service_account_email" {
  description = "The service account email address assigned to the instance"
  value = google_sql_database_instance.sql.service_account_email_address
}