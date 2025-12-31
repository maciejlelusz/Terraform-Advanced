# Lab 03 — Konsumpcja remote state: warstwa aplikacji

## Cel
Odczytać kontrakt sieci z Lab 02 i uruchomić EC2 + SG.

## Backend (S3 + DynamoDB)
1) Skopiuj szablon:
```bash
cp ../../00_tooling/backend.hcl.example backend.hcl
```
2) Ustaw w `backend.hcl`:
- `bucket` (z backend-bootstrap)
- `region`
- `dynamodb_table`
- `key = "labs/lab_03/terraform.tfstate"`

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
1) Uzupełnij `state_bucket` i `state_lock_table`.
2) `terraform apply`
3) Otwórz: `http://<instance_public_ip>`
