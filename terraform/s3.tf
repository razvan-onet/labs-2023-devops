resource "aws_s3_bucket" "bucket-labs" {
  bucket = "bucket-for-terraform-labs2"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.bucket-labs.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.bucket-labs.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

output "bucket-url" {
  value = aws_s3_bucket_website_configuration.example.website_endpoint
}
