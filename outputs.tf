output "cluster" {
  value = google_container_cluster.k8sexample.name
}

output "host" {
  value     = google_container_cluster.k8sexample.endpoint
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = base64decode(google_container_cluster.k8sexample.master_auth.0.cluster_ca_certificate)
  sensitive = true
}

output "username" {
  value     = google_container_cluster.k8sexample.master_auth.0.username
  sensitive = true
}

output "password" {
  value     = google_container_cluster.k8sexample.master_auth.0.password
  sensitive = true
}

output "kubeconfig" {
  value = data.template_file.kubeconfig.rendered
}

output "project_id" {
  value = google_container_cluster.k8sexample.project
}

