terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.12.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "k8s-learning-479921"
  region = "us-central1"
  zone = "us-central1-c"
  credentials = "./terraform-key.json"
}

resource "google_compute_instance" "vm-type-raspberry-from-terraform" {
  name = "pi3"
  machine_type = "e2-custom-medium-1024"
  zone = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}
