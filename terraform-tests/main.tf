variable "varA" {
  type = string
}

output "resultA" {
	value = var.varA
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  random = {
      source = "hashicorp/random"
  }

  }
}

resource "random_id" "rand" {
  byte_length = 2
}


resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial-${random_id.rand.hex}"
}

