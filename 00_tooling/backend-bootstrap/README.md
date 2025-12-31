# Backend bootstrap (S3 + DynamoDB)

## Cel
Utworzyć:
- S3 bucket na stan (versioning + szyfrowanie + public access block)
- DynamoDB table na locking

## Kroki
```bash
cp terraform.tfvars.example terraform.tfvars
# uzupełnij state_bucket_name unikalną nazwą
terraform init
terraform apply
```

Zapisz outputy: `state_bucket_name`, `lock_table_name`, `aws_region`.
