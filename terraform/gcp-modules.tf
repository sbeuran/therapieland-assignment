module "project_service" {
  source = "./modules/gcp/project_service"
  project = var.gcp-project-name
}

module "networking" {
  source = "./modules/gcp/networking"
  project = var.gcp-project-name

  therapieland-vpc-gke-subnet-01-cidr = var.therapieland-vpc-gke-subnet-01-cidr
}

module "database" {
  source = "./modules/gcp/database"
  
  depends_on = [ 
    module.project_service.google_project_service_sqladmin_id
  ]

  project = var.gcp-project-name
  region = var.gcp-project-region

  db-instance-network-self-link = module.networking.therapieland-vpc-network-self-link
  therapieland-db-google-service-networking-connection-id = module.networking.therapieland-db-google-service-networking-connection-id
  
  db-instance-database-version = var.gcp-database-version
  db-instance-tier = var.gcp-database-instance-tier
  
  db-name = var.gcp-database-name
  db-instance-user = var.gcp-database-instance-user
  db-instance-password = var.gcp-database-instance-password
}

module "gke" {
  source = "./modules/gcp/gke"
  project = var.gcp-project-name

  depends_on = [ 
    module.project_service.google_project_service_container_id,
    module.project_service.google_project_service_cloudresourcemanager_id
  ]

  k8s-node-locations = var.gcp-gke-node-locations
  gke-node-tier = var.gcp-gke-node-tier

  therapieland-vpc-name = module.networking.therapieland-vpc-name
  therapieland-vpc-gke-subnet-01-name = module.networking.therapieland-vpc-gke-subnet-01-name

  region = var.gcp-project-region
  service-account-email = var.gcp-terraform-service-account-email
}