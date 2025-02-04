# Random Provider:

Supports the use of randomness within Terraform configurations. This is a logical provider, which means that it works entirely within Terraform logic, and does not interact with any other services.

Example: Suppose if user didnt specify any name ec2 instances then we can a generate a random name to them.

Random provider link: https://registry.terraform.io/providers/hashicorp/random/latest

```
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "random" {
  # Configuration options
}
```

Random Provider Resources:

1. random_uuid (Resource)
   The resource random_uuid generates a random uuid string that is intended to be used as a unique identifier for other resources.

   example:
   ```
   resource "random_uuid" "test" {
   }
   output "UUID" {
     value = random_uuid.test.id 
   }
   ```
2. random_string (Resource)
   The resource random_string generates a random permutation of alphanumeric characters and optionally special characters.

   example:
   ```
   resource "random_string" "random" {
    length           = 16
    special          = true
    override_special = "/@£$"
   }
   ```
   Required:
    length (Number) The length of the string desired. The minimum value for length is 1 and, length must also be >= (min_upper + min_lower + min_numeric + min_special).
   Optional
    1. keepers (Map of String) Arbitrary map of values that, when changed, will trigger recreation of resource. See the main provider documentation for more  
       information.
    2. lower (Boolean) Include lowercase alphabet characters in the result. Default value is true.
    3. min_lower (Number) Minimum number of lowercase alphabet characters in the result. Default value is 0.
    4. min_numeric (Number) Minimum number of numeric characters in the result. Default value is 0.
    5. min_special (Number) Minimum number of special characters in the result. Default value is 0.
    6. min_upper (Number) Minimum number of uppercase alphabet characters in the result. Default value is 0.
    7. number (Boolean, Deprecated) Include numeric characters in the result. Default value is true. If number, upper, lower, and special are all configured, 
       at least one of them must be set to true. NOTE: This is deprecated, use numeric instead.
    8. numeric (Boolean) Include numeric characters in the result. Default value is true. If numeric, upper, lower, and special are all configured, at least 
       one of them must be set to true.
    9. override_special (String) Supply your own list of special characters to use for string generation. This overrides the default character list in the 
       special argument. The special argument must still be set to true for any overwritten characters to be used in generation.
    10. special (Boolean) Include special characters in the result. These are !@#$%&*()-_=+[]{}<>:?. Default value is true.
    11. upper (Boolean) Include uppercase alphabet characters in the result. Default value is true.

3. random_pet (Resource)
   The resource random_pet generates random pet names that are intended to be used as unique identifiers for other resources.

   example:
   ```
   resource "random_pet" "name" {
     length = 3
     prefix = "Big-Data"
     separator = "_"
   }
   ```
  Optional
    1. keepers (Map of String) Arbitrary map of values that, when changed, will trigger recreation of resource. See the main provider documentation for more information.
    2. length (Number) The length (in words) of the pet name. Defaults to 2
    3. prefix (String) A string to prefix the name with.
    4. separator (String) The character to separate words in the pet name. Defaults to "-"
4. random_shuffle (Resource)
   The resource random_shuffle generates a random permutation of a list of strings given as an argument.
    Required
      input (List of String) The list of strings to shuffle.
    Optional
    1. keepers (Map of String) Arbitrary map of values that, when changed, will trigger recreation of resource. See the main provider documentation for more information.
    2. result_count (Number) The number of results to return. Defaults to the number of items in the input list. If fewer items are requested, some elements will be excluded from the result. If more items are requested, items will be repeated in the result but not more frequently than the number of items in the input list.
    3. seed (String) Arbitrary string with which to seed the random number generator, in order to produce less-volatile permutations of the list.

    example:
    ```
    resource "random_shuffle" "name" {
      input = ["t2.micro", "t3.micro", "t2.medium"]
      result_count = 2 # count of elements need to pic from the list
    }
    ```
5. random_integer (Resource)
   The resource random_integer generates random values from a given range, described by the min and max attributes of a given resource.
   Required
    1. max (Number) The maximum inclusive value of the range.
    2. min (Number) The minimum inclusive value of the range.
   Optional
    1. keepers (Map of String) Arbitrary map of values that, when changed, will trigger recreation of resource. See the main provider documentation for more information.
    2. seed (String) A custom seed to always produce the same value.
6. random_password (Resource)
   Identical to random_string with the exception that the result is treated as sensitive and, thus, not displayed in console output.
   ```
   resource "random_password" "password" {
     length           = 16
     special          = true
     override_special = "!#$%&*()-_=+[]{}<>:?"
   }
   ``` 