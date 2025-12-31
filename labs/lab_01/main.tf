resource "random_id" "suffix" { byte_length = 3 }
resource "aws_s3_bucket" "example" { bucket = "${var.name_prefix}-lab01-${random_id.suffix.hex}" }
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
output "bucket_name" { value = aws_s3_bucket.example.bucket }
