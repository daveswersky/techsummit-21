## VARIABLES
variable "project_id" {
  default = "primaryproject-305315"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "network_name" {
  default = "vm-network"
}

## PROVIDER
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

## RESOURCES
resource "google_compute_network" "default" {
  name                    = var.network_name
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "default" {
  name                     = var.network_name
  ip_cidr_range            = "10.127.0.0/20"
  network                  = google_compute_network.default.self_link
  region                   = var.region
  private_ip_google_access = true
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.default.self_link
    access_config {
      protocol = "tcp"
      ports = ["22"]
    }
  }
}