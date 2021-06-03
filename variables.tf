variable "gcp_region" {
  description = "GCP region, e.g. us-east1"
  default     = "us-central1"
}

variable "gcp_zone" {
  description = "GCP zone, e.g. us-east1-b (which must be in gcp_region)"
  default     = "us-central1-c"
}

variable "gcp_project" {
  description = "GCP project name"
  default     = "dwright-gcp-demos"
}

variable "initial_node_count" {
  description = "Number of worker VMs to initially create"
  default     = 3
}

variable "master_username" {
  description = "Username for accessing the Kubernetes master endpoint"
  default     = "k8smaster"
}

variable "master_password" {
  description = "Password for accessing the Kubernetes master endpoint"
  default     = "k8smasterk8smaster"
}

variable "node_machine_type" {
  description = "GCE machine type"
  default     = "n1-standard-2"
}

variable "node_disk_size" {
  description = "Node disk size in GB"
  default     = "30"
}
