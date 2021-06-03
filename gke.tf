resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}


resource "google_container_cluster" "k8sexample" {
  name               = random_pet.name.id
  description        = "k8s demo cluster"
  location           = var.gcp_zone
  project            = var.gcp_project
  initial_node_count = var.initial_node_count
 

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

data "template_file" "kubeconfig" {
  template = "${path.module}/templates/kubeconfig-template.yaml"

  vars = {
    cluster_name    = google_container_cluster.k8sexample.name
    user_name       = google_container_cluster.k8sexample.master_auth[0].username
    user_password   = google_container_cluster.k8sexample.master_auth[0].password
    endpoint        = google_container_cluster.k8sexample.endpoint
    cluster_ca      = google_container_cluster.k8sexample.master_auth[0].cluster_ca_certificate
    client_cert     = google_container_cluster.k8sexample.master_auth[0].client_certificate
    client_cert_key = google_container_cluster.k8sexample.master_auth[0].client_key
  }
}



