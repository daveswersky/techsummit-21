## PROVIDER
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 1.3"

  name       = "${var.project_id}-tfstate"
  project_id = var.project_id
  location   = var.region
  
}