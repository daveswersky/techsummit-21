## SUBNET
resource "google_compute_subnetwork" "default" {
  name                     = "mig-subnet"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = "default"
  region                   = var.region
  private_ip_google_access = true
}