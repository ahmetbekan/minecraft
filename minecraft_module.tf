module "minecraft_deploy" {
  source                 = "fuchicorp/chart/helm"
  deployment_name        = "minecraft-server"
  deployment_environment = "minecraft"
  deployment_endpoint    = "minecraft.${var.google_domain_name}"
  deployment_path        = "minecraft"

  template_custom_vars = {
    minecraft_ip_ranges = "${join(",",var.common_tools_access)}"
  }
}
