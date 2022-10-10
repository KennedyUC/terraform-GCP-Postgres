resource "google_sql_database_instance" "gcp_sql" {
  name                = "${var.instance_name}-instance"
  database_version    = var.database_version
  region              = var.region
  project             = var.project_id
  deletion_protection = var.enable_deletion_protection

  settings {
    tier              = var.tier
    activation_policy = var.activation_policy
    disk_size         = var.disk_size
    disk_type         = var.disk_type
    disk_autoresize   = var.disk_autoresize

    ip_configuration {
      private_network = var.private_network_enabled ? var.private_network : null
      ipv4_enabled    = var.private_network_enabled ? null : var.ipv4_enabled
      require_ssl     = var.require_ssl
    }

    backup_configuration {
      enabled         = var.backup_enabled
      start_time      = var.backup_start_time
    }

  }

  timeouts {
    create = var.resource_timeout
    delete = var.resource_timeout
    update = var.resource_timeout
  }
}


resource "google_sql_database" "gcp_sql" {
  name      = "${var.database_name}-db"
  project   = google_sql_database_instance.gcp_sql.project
  instance  = google_sql_database_instance.gcp_sql.name
  charset   = var.db_charset
  collation = var.db_collation
}


resource "google_sql_user" "db_users" {
  name      = var.sql_user
  project   = google_sql_database_instance.gcp_sql.project
  instance  = google_sql_database_instance.gcp_sql.name
  password  = var.user_password
}