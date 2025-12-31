# Lab 06 — Migracja: terraform import + state mv

## Cel
Zaimportować zasób i wykonać refaktoryzację adresu w stanie.

## Backend (S3 + DynamoDB)
1) Skopiuj szablon:
```bash
cp ../../00_tooling/backend.hcl.example backend.hcl
```
2) Ustaw w `backend.hcl`:
- `bucket` (z backend-bootstrap)
- `region`
- `dynamodb_table`
- `key = "labs/lab_06/terraform.tfstate"`

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
A) Import:
- utwórz bucket ręcznie i wykonaj `terraform import`

B) Refactor:
- zmień nazwę zasobu w kodzie i wykonaj `terraform state mv`
