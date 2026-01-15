variable "machine_name" {
  description = "Name for my machine"
  default     = "INSERT_MACHINE_NAME"
}

variable "region" {
  description = "region"
  default     = "INSERT_GCP_REGION"
}

variable "zone" {
  description = "zone"
  default     = "INSERT_GCP_ZONE"
}

variable "credentials" {
  description = "My credentials file"
  default     = "./keys/INSERT_YOUR_FILE_NAME"
}

variable "project_id" {
  description = "My project id"
  default     = "INSERT_GCP_PROJECT_ID"
}

variable "service_account_email" {
  description = "Service account e-mail address"
  default     = "INSERT_SERVICE_ACCOUNT_EMAIL"
}