provider "google" {
  project = "primaryproject-305315"
  region  = "us-central1"
  zone    = "us-central1-c"
}

module "vm_instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "6.1.0"
  # insert the 3 required variables here
}

module "instance_template" {
  source             = "terraform-google-modules/vm/google//modules/instance_template"
  project_id         = var.project_id
  subnetwork         = var.subnetwork
  service_account    = var.service_account
  subnetwork_project = var.project_id
}