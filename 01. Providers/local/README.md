Local provider link: https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file

Using local provider we can manage only local files.

# To create local file in root directory

```
hcl
resource "local_file" "foo" {
  content = "foo!"
  filename = "${path.module}/foo.bar"
}
```

# File Resource Documentation

## Required Parameters

- **`filename` (String)**  
  The path to the file that will be created. Missing parent directories will be created.  
  If the file already exists, it will be overridden with the given content.

## Optional Parameters

- **`content` (String)**  
  Content to store in the file, expected to be a UTF-8 encoded string.  
  Conflicts with `sensitive_content`, `content_base64`, and `source`.  
  *Exactly one* of these four arguments must be specified.

- **`content_base64` (String)**  
  Content to store in the file, expected to be binary encoded as a base64 string.  
  Conflicts with `content`, `sensitive_content`, and `source`.  
  *Exactly one* of these four arguments must be specified.

- **`directory_permission` (String)**  
  Permissions to set for directories created (before `umask`), expressed as a string in numeric notation.  
  **Default value:** `"0777"`.

- **`file_permission` (String)**  
  Permissions to set for the output file (before `umask`), expressed as a string in numeric notation.  
  **Default value:** `"0777"`.

- **`sensitive_content` (String, Sensitive, Deprecated)**  
  Sensitive content to store in the file, expected to be a UTF-8 encoded string. Will not be displayed in diffs.  
  Conflicts with `content`, `content_base64`, and `source`.  
  *Exactly one* of these four arguments must be specified.  
  **Note:** If sensitive content is required, please use the `local_sensitive_file` resource instead.

- **`source` (String)**  
  Path to a file to use as a source for the one being created.  
  Conflicts with `content`, `sensitive_content`, and `content_base64`.  
  *Exactly one* of these four arguments must be specified.

# Terraform Local File Resource Example

This repository demonstrates the usage of Terraform's `local_file` and `local_sensitive_file` resources to manage local files with various types of content and configurations.

## Terraform Provider Configuration

The following configuration defines the required provider for Terraform's local resources:

```hcl
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}
```
Resource local_file Examples:

1. Creates local file with given content.
path.module is a built-in expression that refers to the filesystem path of the module where the configuration is defined. It provides the absolute path to the directory containing the current module's .tf files.

```
hcl
resource "local_file" "foo" {
  content  = "foo!"  
  filename = "${path.module}/foo.bar"
}
```

2. Creates local file with given multiline strings content

```
hcl
resource "local_file" "foo1" {  # EOF is a delimiter
  content = <<EOF
This is first line
THis is second line
  EOF
  filename = "${path.module}/foo.bar"
}
```
3. Creates a local file with the same content as the file specified in the source argument.

```
hcl
resource "local_file" "foo2" {
  source  = "./main.tf"
  filename = "${path.module}/foo.bar"
}
```
4. Creates local file with given sensitive content.
   When you are applying Terraform configuration, content will be sensitive and it won't be visible in Terraform apply logs like below.

```
hcl
#   + resource "local_sensitive_file" "foo" {
#       + content              = (sensitive value)
#       + content_base64sha256 = (known after apply)
#       + content_base64sha512 = (known after apply)
#       + content_md5          = (known after apply)
#       + content_sha1         = (known after apply)
#       + content_sha256       = (known after apply)
#       + content_sha512       = (known after apply)
#       + directory_permission = "0700"
#       + file_permission      = "0700"
#       + filename             = "./foo.bar"
#       + id                   = (known after apply)
#     }
resource "local_sensitive_file" "foo" {
  content  = "foo! with local_sensitive_file"
  filename = "${path.module}/foo.bar"
}
```
5. The content_base64 argument allows you to provide file content as a Base64-encoded string.
This is useful for binary data or when encoding is required. base64encode is a Terraform function that encodes the given string in Base64.

```
hcl
resource "local_file" "name" {
  filename      = "example.txt"
  content_base64 = base64encode("Hello there !")
}
```
6. The directory_permission argument defines the permissions to be set for any directories created by the local_file resource.
If path/to does not exist, Terraform will create the necessary directories, and their permissions will be set to 0755.

When the directory does not exist: Terraform will create the directory with the specified directory_permission.
When the directory already exists: Terraform will not change the permissions of the existing directory. The permissions for existing directories will remain as they were before applying the configuration.
Remember when destroying this resource which has directory_permission, the directory won't be deleted automatically. To delete, you need to use the null_resource with a local-exec provisioner.

```
hcl
resource "local_file" "name1" {
  filename             = "${path.module}/saikiran/example.txt"
  directory_permission = "0755"
  content              = "Hello you are with directory_persmission argument"
}
```
7. file_permission controls the permissions for the file created.
If the file specified in the filename argument already exists, Terraform will overwrite the file with the new content, and it will also apply the file_permission to the file as part of the process.
When the file exists: Terraform will overwrite the existing file with the new content you specify in the content argument (or content_base64, depending on the configuration). The permissions specified in file_permission will be applied to the file when it is overwritten.
When the file does not exist: Terraform will create the file with the specified content and apply the file_permission.

```
hcl
resource "local_file" "example1" {
  filename        = "example.txt"
  content         = "This is the content."
  file_permission = "0644"  # File will be created or overwritten with these permissions
}
```
Notes:

1. Directory Permission: If the directory path does not exist, Terraform will create it with the specified directory_permission. However, if the directory already exists, Terraform will not modify its permissions. If you need to delete the directory, you'll need to use a null_resource with a local-exec provisioner.
2. File Permission: When a file is created or overwritten, the file_permission argument will control the file's permissions.