resource "random_id" "suffix" { byte_length = 3 }
resource "aws_s3_bucket" "shared_logs" {
  provider = aws.shared
  bucket   = "${var.name_prefix}-lab07-shared-logs-${random_id.suffix.hex}"
}
output "shared_bucket" { value = aws_s3_bucket.shared_logs.bucket }
