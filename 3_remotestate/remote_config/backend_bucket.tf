## PROVIDER
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 1.7"
  project_id  = var.project_id
  name = "${var.project_id}-tfstate"
  prefix = "tf-backend"
  set_admin_roles = true
  admin = ["user:admin@daveswersky.altostrat.com"]
  versioning = {
    first = true
  }
}