# Lab 02 — Separacja stanów: warstwa sieci (VPC)

## Cel
Zbudować sieć w osobnym stanie i wystawić kontrakt outputami.

## Backend (S3 + DynamoDB)
1) Skopiuj szablon:
```bash
cp ../../00_tooling/backend.hcl.example backend.hcl
```
2) Ustaw w `backend.hcl`:
- `bucket` (z backend-bootstrap)
- `region`
- `dynamodb_table`
- `key = "labs/lab_02/terraform.tfstate"`

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
2) Sprawdź outputy: `terraform output -json`
3) Zapisz `vpc_id` i `public_subnet_ids` (użyjesz w Lab 03).
