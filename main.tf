terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# Create nginx container directly using image name
resource "docker_container" "nginx" {
  name  = "terraform-nginx"
  image = "nginx:latest"   # <-- direct image name string

  ports {
    internal = 80
    external = 9080
    protocol = "tcp"
  }
}

# Outputs
output "container_name" {
  value = docker_container.nginx.name
}

output "container_id" {
  value = docker_container.nginx.id
}
