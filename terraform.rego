package terraform.enterprise

deny[msg] {
  input.resource_changes[_].type == "aws_security_group"
  rc := input.resource_changes[_]
  some i
  rc.change.after.ingress[i].from_port == 22
  rc.change.after.ingress[i].to_port == 22
  rc.change.after.ingress[i].cidr_blocks[_] == "0.0.0.0/0"
  msg := "Zakaz SSH z 0.0.0.0/0 (ogranicz CIDR lub użyj VPN/bastiona)."
}
