terraform {
  backend "gcs" {
    bucket = "terraform-demo-306115-tfstate"
  }
}