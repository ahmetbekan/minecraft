variable "namespaces" {
  type = "list"
  default = [
    "dev-students",
    "qa-students",
    "prod-students",
    "dev",
    "qa",
    "prod",
    "test",
    "stage",
    "elk"
  ]
  description = "- (Required) list of all namespaces for fuchicorp cluster"
}

variable "deployment_name" {
  default = "common_tools"
}

variable "google_bucket_name" {
  description = "- (Required) please provied bucket name"
}

variable "google_domain_name" {
  default = "fuchicorp.com"
  description = "Please change to your domain name"
}

variable "google_project_id" {
  default = "angular-unison-267720"
}

variable "common_tools_access" {
  type = "list"
  default = [
        "10.40.0.13/8",      ## Cluster access
        "193.36.224.68/32",  ## Mexico IP 
  ]
}

variable "deployment_environment" {
  default = "tools"
  description = "Namespace of the deployment <It will be created>"
}


variable "credentials" {
  default = "common-service-account.json"
}