variable "gcp-project-name" {
  type = string
}

variable "gcp-project-region" {
  type = string
}

variable "gcp-gke-node-locations" {
  type = list
}

variable "gcp-gke-node-tier" {
  type = string
}

variable "gcp-database-instance-tier" {
  type = string
}

variable "gcp-database-version" {
  type = string
}

variable "gcp-database-instance-root-password" {
  type = string
}

variable "gcp-terraform-credentials-file-location" {
  type = string
}

variable "gcp-terraform-service-account-email" {
  type = string
}

variable "therapieland-vpc-gke-subnet-01-cidr" {
  type = string
}

variable "therapieland-vpc-db-subnet-01-cidr" {
  type = string
}