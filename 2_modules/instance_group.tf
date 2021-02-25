

module "instance_template" {
  source             = "terraform-google-modules/vm/google//modules/instance_template"
  project_id         = var.project_id
  subnetwork         = var.subnetwork
  service_account    = var.service_account
  subnetwork_project = var.project_id
}