terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {
}

locals {
  file_content = {
     "test1.txt" = <<EOF
Welcome Kandakatla Srikanth
It was generated from Terraform in test1.
EOF

    "test2.txt" = <<EOF
Welcome Kandakatla Srikanth
It was generated from Terraform in test2.
EOF
  }
}

resource "local_file" "Testfile" {
  for_each = toset(var.FileName)
  filename = "E:\\${each.value}"

  content = local.file_content[each.value]
}