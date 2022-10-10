// SQL Instance Variables
variable "database_version" {
    type        = string
    default     = "POSTGRES_12"
    description = "The MySQL, PostgreSQL or SQL Server version to be deployed"
}

variable "instance_name" {
    type        = string
    description = "Specify the name of the GCP SQL Instance to be created"
}

variable "region" {
    type        = string
    default     = "us-central1"
    description = "Specify the GCP Region that will host the SQL instance"
}

variable "project_id" {
    type        = string
    description = "Specify the GCP Project ID"
}

variable "tier" {
    type        = string
    default     = "db-f1-micro"
    description = "Specify the machine type of the SQL instance"
}

variable "enable_deletion_protection" {
    type        = bool
    default     = false
    description = "Specify whether or not to allow Terraform to destroy the SQL instance"
}

variable "activation_policy" {
    type        = string
    default     = "ALWAYS"
    description = "Specify when the SQL instance should be active. Possible values: ALWAYS, NEVER or ON_DEMAND"
}

variable "disk_size" {
    type        = number
    default     = 10
    description = "Specify the size of data disk, in GB. Size of a running instance cannot be reduced but can be increased. The minimum value is 10GB."
}

variable "disk_type" {
    type        = string
    default     = "PD_SSD"
    description = "Specify the type of data disk: PD_SSD or PD_HDD"
}

variable "disk_autoresize" {
    type        = bool
    default     = true
    description = "Specify whether auto-resizing of the storage size is enabled"
}

variable "ipv4_enabled" {
    type        = bool
    default     = true
    description = "Specify whether the SQL instance should be assigned a public IPV4 address"
}

variable "private_network_enabled" {
    type        = bool
    default     = false
    description = "Specify whether private network is enabled. Set as 'true' if private network is configured"
}

variable "private_network" {
    type        = string
    default     = null
    description = "Specify the VPC network from which the SQL instance is accessible for private IP"
}

variable "require_ssl" {
    type        = bool
    default     = true
    description = "Specify whether SSL connections over IP are enforced or not."
}

variable "resource_timeout" {
    type        = number
    default     = 20
    description = "Specify the Timeouts for the various configuration options of the instance"
}

variable "backup_enabled" {
    type        = bool
    default     = true
    description = "Specify if backup is enabled for the created instance"
}

variable "backup_start_time" {
    type        = string
    default     = "03:00"
    description = "Specify the start time for backup in UTC in 'HH:MM' format"
}


// Database Variables
variable "database_name" {
    type        = string
    description = "Specify the name of the SQL database"
}

variable "db_charset" {
    type        = string
    default     = "utf8"
    description = "Specify the character set value of the database. Postgres databases only support a value of UTF8 at creation time."
}

variable "db_collation" {
    type        = string
    default     = "en_US.UTF8"
    description = "Specify the collation value for the database. Postgres databases only support a value of en_US.UTF8 at creation time."
}

// User Variables
variable "sql_user" {
    type        = string
    description = "Specify the username of the SQL instance user"
}

variable "user_password" {
    type        = string
    description = "Specify the password for the SQL user"
}