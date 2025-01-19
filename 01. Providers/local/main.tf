terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

# provider "local" {

# }

resource "local_file" "foo" {
  content = "foo!"  
  filename = "${path.module}/foo.bar"
}

resource "local_file" "foo1" {  # EOF is a delimiter
  content = <<EOF
This is first line
THis is second line
  EOF
  filename = "${path.module}/foo.bar"
}

resource "local_file" "foo2" {
  source = "./main.tf"
  filename = "${path.module}/foo.bar"
}

resource "local_sensitive_file" "foo" {
  content = "foo! with local_sensitive_file"
  filename = "${path.module}/foo.bar"
}

resource "local_file" "name" {
  filename = "example.txt"
  content_base64 = base64encode("Hello there !")
}

resource "local_file" "name1" {
  filename = "${path.module}/saikiran/example.txt"
  directory_permission = "0755"
  content = "Hello you are with directory_persmission argument"
}

resource "local_file" "example1" {
  filename        = "example.txt"
  content         = "This is the content."
  file_permission = "0644"  # File will be created or overwritten with these permissions
}
