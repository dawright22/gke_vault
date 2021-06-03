terraform {
  # backend "remote" {
  #   organization = "hashicorp-learn"    
  #   workspaces {
  #     name = "learn-terraform-pipelines-k8s"
  #   }
  # }
required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.55"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.2"
    }
}

required_version = "~> 0.14"
}


provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

resource "random_pet" "name" {
  prefix = "k8s-vault"
  length = 1
}

# Retrieve GKE cluster information

data "google_client_config" "default" {}

data "google_container_cluster" "my_cluster" {
  name     = random_pet.name.id
  location = var.gcp_region
}


provider "kubernetes" {
  host                   = google_container_cluster.k8sexample.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = "${base64decode(google_container_cluster.k8sexample.master_auth.0.cluster_ca_certificate)}"

}

provider "helm" {
  kubernetes {
    host                   = google_container_cluster.k8sexample.endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = "${base64decode(google_container_cluster.k8sexample.master_auth.0.cluster_ca_certificate)}"
  }
}