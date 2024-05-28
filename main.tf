provider "local" {
  // No specific configuration needed for the local provider
}

variable "remote_user" {
  description = "Username for the remote server"
  type        = string
}

variable "remote_host" {
  description = "IP address or hostname of the remote server"
  type        = string
}

variable "password" {

  type        = string
  sensitive   = true
}

variable "compose_file_path" {
  description = "Path to the Docker Compose file on the remote server"
  type        = string
}

resource "null_resource" "run_docker_compose" {
  connection {
    type        = "ssh"
    user        = var.remote_user
    host        = var.remote_host
    password = var.password
  }

  provisioner "remote-exec" {
    inline = [
      "docker-compose -f ${var.compose_file_path} up -d --build"
    ]
  }

  triggers = {
    always_run = "${timestamp()}"
  }

}


output "compose_file_path" {
  value = var.compose_file_path
}
