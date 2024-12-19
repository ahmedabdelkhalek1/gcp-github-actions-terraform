terraform {
  backend "gcs" {
      bucket = "ahmedabdelkhalek-terrafrom-tfstate"
    }
}
provider "google" {
  project = var.project_id
  region  = var.region
}

