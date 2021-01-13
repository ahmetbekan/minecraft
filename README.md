# Minecraft

[Minecraft](https://minecraft.net/en/) is a game about placing blocks and going on adventures.

## Introduction

This repo help you create a Minecraft server with single Minecraft Pod, plus Services for the Minecraft server and RCON.

## Prerequisites

- Kubernetes 1.4+ Follow Link to create GKE Cluster [Terraform-GKE Module](https://github.com/berkayh27/terraform-gke-module)
- Copy `cluster-service-account.json` that was created during GKE Cluster creation to `minecraft` directory.
- 512 MB of RAM
- Install External-DNS to Kubernetes Cluster [External DNS - Helm Chart] (https://github.com/helm/charts/tree/master/stable/external-dns)
- PV provisioner support in the underlying infrastructure
- create a `minecraft` namespace. `kubectl create namespace minecraft`

## Create 'minecraft.tfvars' for Minecraft Server

```
google_bucket_name        = ""                              ## your Google Cloud bucket name
deployment_name           = ""                              ## enter a uniquie deployment name
google_project_id         = ""                              ## Google Cloud Project ID
google_domain_name        = ""                              ## Domain name for your minecraft-server (Optional)
credentials               = "cluster-service-account.json"  ## Make sure you have cluster-service-account.json located in minecraft directory
deployment_environment    = "minecraft"                     ## Namespace for minecraft-server


## Please Specify the IP addresses allow to access your minecraft-server

common_tools_access = [ 
                        "10.16.0.27/8",         ## Your clusters Private IP
                        "189.161.28.247/32",    ## Sample IP
                        "187.190.154.9/32",     ## Sample IP 2
]
```


## Create minecraft-server - Terraform Plan/Apply

Use the set-env.sh file to be able to set up local environment variables:

`source set-env.sh miencraft.tfvars`

We need to plan all changes before applying them:

`terraform plan -var-file=$DATAFILE ## Displays what would be executed`

For applying all changes we need to run the following command:

`terraform apply  -var-file=$DATAFILE`

