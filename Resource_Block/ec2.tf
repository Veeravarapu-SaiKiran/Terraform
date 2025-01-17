resource "aws_instance" "web" {
  ami           = "ami-0d2614eafc1b0e4d2"
  instance_type = "t2.micro"
  tags = {
    Name = "Hello World"
  }
}