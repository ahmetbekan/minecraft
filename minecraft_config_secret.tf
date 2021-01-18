resource "kubernetes_secret" "minecraft_config" {
  metadata {
    name      = "minecraft-config"
    namespace = "tools"

    labels = {
      "jenkins.io/credentials-type" = "secretFile"
    }

    annotations = {
      "jenkins.io/credentials-description" = "minecraft config"
    }
  }

  data = {
    filename = "minecraft.tfvars"
    "data"   = "${file("minecraft.tfvars")}"
  }
}
