![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC%20BY--NC--ND%204.0-lightgrey.svg)

# Terraform Advanced

Kontynuacja szkolenia **Terraform Fundamentals**. LAB-y są napisane „krok po kroku” i pokazują typowe wzorce enterprise w oparciu o AWS.

## Wymagania
- Terraform >= 1.5
- AWS CLI v2 (zalogowane: `aws sts get-caller-identity`)
- (opcjonalnie) conftest (OPA) do Lab 08
- (opcjonalnie) Go 1.22+ do Lab 10 (Terratest)

## Struktura
- `00_tooling/backend-bootstrap/` — bootstrap backendu S3 + DynamoDB
- `00_tooling/backend.hcl.example` — szablon backendu do LAB-ów
- `labs/lab_01` ... `labs/lab_10` — ćwiczenia
- `policies/` — polityki OPA

## Uruchamianie
Każdy lab:
```bash
cd labs/lab_XX
cp ../../00_tooling/backend.hcl.example backend.hcl
cp terraform.tfvars.example terraform.tfvars
# edytuj backend.hcl i terraform.tfvars
terraform init -backend-config=backend.hcl
terraform plan
terraform apply
terraform destroy
```

## Licencja
Materiały: **CC BY-NC-ND 4.0**.
