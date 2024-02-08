terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.14.0"
    }
  }

  backend "gcs" {
    bucket = "your GCS bucket"
  }

  required_version = ">= 1.7.0"
}


provider "google" {
  credentials = file("~/.config/gcloud/application_default_credentials.json")

  project = "your GCP project"
  region  = "your GCP region"
}

resource "google_compute_network" "sample_vpc_network" {
  name = "terraform-network"
}

module "service_account" {
  source = "../../modules/service_account"

  sample_var = "sample-${var.env}"
}

