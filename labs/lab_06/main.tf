resource "aws_s3_bucket" "to_import" { bucket = "${var.name_prefix}-lab06-import-me" }
output "bucket" { value = aws_s3_bucket.to_import.bucket }
