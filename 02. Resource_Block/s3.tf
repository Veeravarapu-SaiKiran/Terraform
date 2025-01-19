resource "aws_s3_bucket" "example" {
  bucket = "naaaaaa-bucket"
  tags = {
    Name = "My Bucket"
    Environment = "Dev"
  }
}