variable "therapieland-vpc-name" {
  type = string
}

variable "therapieland-vpc-gke-subnet-01-name" {
  type = string
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "k8s-node-locations" {
  type = list
}

variable "service-account-email" {
  type = string
}

variable "gke-node-tier" {
  type = string
}