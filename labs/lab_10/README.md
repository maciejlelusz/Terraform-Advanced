# Lab 10 — Testy integracyjne: Terratest (Go)

## Cel
Test integracyjny uruchamiający apply/destroy i asercje na outputach.

## Backend (S3 + DynamoDB)
1) Skopiuj szablon:
```bash
cp ../../00_tooling/backend.hcl.example backend.hcl
```
2) Ustaw w `backend.hcl`:
- `bucket` (z backend-bootstrap)
- `region`
- `dynamodb_table`
- `key = "labs/lab_10/terraform.tfstate"`

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
1) Lokalnie:
```bash
terraform init -backend-config=backend.hcl
terraform apply
terraform destroy
```

2) Terratest:
```bash
cd terratest
go test -v
```

## Enterprise
- uruchamiaj testy na sandbox/ephemeral AWS account
- unikaj współdzielenia backendu testów między buildami
