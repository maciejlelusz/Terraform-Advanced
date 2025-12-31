# Lab 05 — for_each + dynamic: reguły SG jako dane

## Cel
Zbudować SG dynamicznie na podstawie mapy reguł.

## Backend (S3 + DynamoDB)
1) Skopiuj szablon:
```bash
cp ../../00_tooling/backend.hcl.example backend.hcl
```
2) Ustaw w `backend.hcl`:
- `bucket` (z backend-bootstrap)
- `region`
- `dynamodb_table`
- `key = "labs/lab_05/terraform.tfstate"`

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
1) Wstaw `vpc_id` (np. z Lab 02)
2) Ustaw `ssh` na swoje IP `/32`
3) `terraform apply`
4) Dodaj regułę 443 w `ingress_rules` i sprawdź plan
