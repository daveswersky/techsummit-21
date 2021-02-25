## RESOURCE MODULES
resource "google_compute_subnetwork" "default" {
  name                     = "default"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = "default"
  region                   = var.region
  private_ip_google_access = true
}

module "instance_template" {
  source             = "terraform-google-modules/vm/google//modules/instance_template"
  version            = "6.1.0"
  project_id         = var.project_id
  subnetwork         = google_compute_subnetwork.default.self_link
  service_account    = var.service_account
  subnetwork_project = var.project_id
}

module "vm_mig" {
  source            = "terraform-google-modules/vm/google//modules/mig"
  version           = "6.1.0"
  project_id        = var.project_id
  region            = var.region
  target_size       = var.target_size
  hostname          = "mig-simple"
  instance_template = module.instance_template.self_link
}