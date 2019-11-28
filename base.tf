provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}


resource "aws_s3_bucket" "b" {
  bucket = "dannybucket99sss9"
  acl    = "private"

  tags = {
    Name        = "danny bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "test1" {
  bucket  = "dannybucket99sss9"
  key     = "test1.txt"
  content = timestamp()

  depends_on = [aws_s3_bucket.b]
}

resource "aws_s3_bucket_object" "test2" {
  bucket  = "dannybucket99sss9"
  key     = "test2.txt"
  content = timestamp()

  depends_on = [aws_s3_bucket.b]
}
