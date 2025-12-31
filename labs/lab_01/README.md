# Lab 01 — Zdalny backend + locking

## Cel
Skonfigurować zdalny backend i zobaczyć locking (DynamoDB) w praktyce.

## Backend (S3 + DynamoDB)
1) Skopiuj szablon:
```bash
cp ../../00_tooling/backend.hcl.example backend.hcl
```
2) Ustaw w `backend.hcl`:
- `bucket` (z backend-bootstrap)
- `region`
- `dynamodb_table`
- `key = "labs/lab_01/terraform.tfstate"`

## Start
```bash
cp terraform.tfvars.example terraform.tfvars
# uzupełnij terraform.tfvars
terraform init -backend-config=backend.hcl
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

## Sprzątanie
```bash
terraform destroy
```

## Krok po kroku
1) `terraform apply`
2) W drugiej konsoli uruchom równolegle `terraform apply` i zaobserwuj oczekiwanie na lock.
