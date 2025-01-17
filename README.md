# Terraform Core Workflow Commands

Terraform's core workflow consists of commands to manage infrastructure as code. These commands follow a sequence to plan, apply, and manage resources. Below is a comprehensive guide to these commands.

---

## 1. `terraform init`
**Purpose**: Initializes a working directory containing Terraform configuration files.

- Downloads required provider plugins and modules.
- Sets up the backend configuration for storing state files.

**Example**:
```bash
terraform init
```

---

## 2. `terraform validate`
**Purpose**: Validates the configuration files in the current directory.

- Ensures the syntax and structure of the files are correct.
- Does **not** check resource dependencies or execution.

**Example**:
```bash
terraform validate
```

---

## 3. `terraform fmt`
**Purpose**: Formats Terraform configuration files to follow canonical style conventions.

- Makes files easier to read and maintain.
- Can format all files in a directory recursively.

**Example**:
```bash
terraform fmt
```

---

## 4. `terraform plan`
**Purpose**: Creates an execution plan, showing what Terraform will do without making any changes.

- Compares the current state with the desired state in the configuration.
- Highlights additions, changes, or deletions needed.

**Example**:
```bash
terraform plan
```

---

## 5. `terraform apply`
**Purpose**: Applies the changes required to reach the desired state of the configuration.

- Prompts for confirmation before applying changes unless `-auto-approve` is used.

**Example**:
```bash
terraform apply
```

To skip confirmation:
```bash
terraform apply -auto-approve
```

---

## 6. `terraform destroy`
**Purpose**: Destroys all the infrastructure managed by Terraform.

- Useful for tearing down environments or cleaning up resources.
  
**Example**:
```bash
terraform destroy
```

To skip confirmation:
```bash
terraform destroy -auto-approve
```

---

## 7. `terraform show`
**Purpose**: Displays information about the Terraform state or a specific plan file.

**Example**:
```bash
terraform show
```

---

## 8. `terraform output`
**Purpose**: Extracts and displays the values of output variables from the Terraform state.

**Example**:
```bash
terraform output
```

---

## 9. `terraform state`
**Purpose**: Manages the state file directly (advanced use only).

- Subcommands allow for listing, removing, or modifying resources in the state.

**Example**:
```bash
terraform state list
```

---

## 10. `terraform import`
**Purpose**: Brings existing infrastructure into Terraform management.

**Example**:
```bash
terraform import aws_instance.my_instance i-1234567890abcdef0
```

---

## 11. `terraform taint` (Deprecated in Terraform v1.0+)
**Purpose**: Marks a resource for recreation during the next `terraform apply`.

- Use `terraform plan` to verify the marked resource will be replaced.

**Example**:
```bash
terraform taint aws_instance.my_instance
```

---

## 12. `terraform untaint`
**Purpose**: Removes the taint mark from a resource.

**Example**:
```bash
terraform untaint aws_instance.my_instance
```

---

## 13. `terraform graph`
**Purpose**: Generates a dependency graph of the resources in the configuration.

**Example**:
```bash
terraform graph
```

---

## 14. `terraform workspace`
**Purpose**: Manages workspaces for multiple environments (e.g., dev, staging, production).

**Example**:
```bash
terraform workspace list    # Lists workspaces
terraform workspace select  # Switches to a different workspace
```

---

## 15. `terraform login`
**Purpose**: Authenticates with Terraform Cloud or Enterprise.

**Example**:
```bash
terraform login
```

---

## Common Workflow
1. **Initialize**: `terraform init`
2. **Format & Validate**: `terraform fmt` → `terraform validate`
3. **Plan**: `terraform plan`
4. **Apply**: `terraform apply`
5. **Manage Outputs & State**: `terraform output` / `terraform state`
6. **Destroy (when necessary)**: `terraform destroy`

This structured workflow ensures safe and predictable changes to your infrastructure.

