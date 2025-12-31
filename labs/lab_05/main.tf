resource "aws_security_group" "this" {
  name   = "${var.name_prefix}-lab05-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidrs
      description = "rule: ${ingress.key}"
    }
  }

  egress { from_port = 0 to_port = 0 protocol = "-1" cidr_blocks = ["0.0.0.0/0"] }
}
output "sg_id" { value = aws_security_group.this.id }
