resource "random_id" "suffix" { byte_length = 2 }
output "build_artifact" { value = random_id.suffix.hex }
