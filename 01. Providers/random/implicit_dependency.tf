resource "random_pet" "name1" {
  length = 4
  prefix = "Big-Data"
  separator = "_"
}

resource "random_shuffle" "name2" {
  input = ["Dev", "Test", "Staging"]
  result_count = 1
}

output "some_value" {
    value = random_pet.name1.id # Cross reference argument referrencing or Implicit dependency
}
resource "aws_instance" "demo" {
  ami = "ami-0d2614eafc1b0e4d2"
  instance_type = "t2.micro"
  tags = {
    Name = "${random_shuffle.name2.result[0]}_${random_pet.name1.id}" # Interpolation
  }
}