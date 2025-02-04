resource "random_uuid" "name" {
}

output "UUID" {
    value = random_uuid.name.id
}

resource "random_string" "name" {
  length = 16
  special = true # To include special characters
  override_special = "!" # Customize the special characters which you want to get in output string. Overrides the default special character with the provided list.
  lower = false # Specify true if you want to get string in lower
}

output "final_string" {
  value = random_string.name.id
}

resource "random_pet" "name" {
  length = 3
  prefix = "Big-Data"
  separator = "_"
}

output "ec2_instance_name" {
  value = random_pet.name.id  
}

resource "random_shuffle" "name" {
  input = ["t2.micro"]#, "t3.micro", "t2.medium"]
  result_count = 1 # count of elements need to pic from the list
}

output "ec2_instance_type" {
  value = random_shuffle.name.result
}

resource "random_integer" "name" {
  min = 1
  max = 2000000
}

output "unexpected_integer_value" {
  value = random_integer.name.result
}

resource "random_password" "name" {
  length = 16
  special = true
  override_special = "()*!"
}

# output "db_password" {
#   value = random_password.name.result
# }

# outputs:
# UUID = "f38cd86d-6c89-e4a0-5888-da4306c939b3"
# ec2_instance_name = "Big-Data_centrally_epic_malamute"
# ec2_instance_type = tolist([
#   "t2.micro",
#   "t2.medium",
# ])
# final_string = "L7QJ7QC7QU!8MVKE"
# unexpected_integer_value = 1622659