# Terraform Version Constraints
## Constraints

You can specify a range of versions using vairous operators.
1.  !=  Excludes an exact version number
2.  >=  Greater than or equal to a specified version
3.  <=  Less than or equal to a specified version
4.  >   Greater than a specified version
5.  <   Less than a specified version
6.  ~>  Only the right most version component will be incremented  example: 5.13.0 will allow installation of 5.13.1 but not 5.14.0.
  

```t
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.13.0"    # Downloads v5.13.0
    }
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.13.0"    # Downloads v5.14.0
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.13.0"   # Downloads v5.13.1
    }
  }
}
```

## Commands
```
terraform init
rm -rf $PWD/.terraform*
```

## Reference Links
```
https://developer.hashicorp.com/terraform/language/expressions/version-constraints
https://developer.hashicorp.com/terraform/tutorials/configuration-language/provider-versioning
https://developer.hashicorp.com/terraform/tutorials/configuration-language/versions
```