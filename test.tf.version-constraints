terraform {
  required_providers {
    local = {
        source = "hasicorp/local"
        version = "1.4.0"
    }
  }
}

resource "local_file" "pet" {
  filename        = each.value
  content         = "My Pet is Great"
  file_permission = "0700"
  for_each = toset(var.filename)
}
