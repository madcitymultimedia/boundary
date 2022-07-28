terraform {
  required_providers {
    enos = {
      source = "hashicorp.com/qti/enos"
    }
  }
}

variable "name" {
  description = "the binary name"
}

resource "enos_local_exec" "find_binary" {
  inline = ["type -P ${var.name} || (echo \"\n\nCould not find ${var.name} executable. Have you installed it?\n\n\" && exit 1)"]
}

output "path" {
  value = enos_local_exec.find_binary.stdout
}