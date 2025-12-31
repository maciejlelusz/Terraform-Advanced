resource "aws_vpc" "this" { cidr_block = "10.40.0.0/16" }
resource "aws_security_group" "bad" {
  name   = "${var.name_prefix}-lab08-bad-sg"
  vpc_id = aws_vpc.this.id
  ingress { from_port = 22 to_port = 22 protocol = "tcp" cidr_blocks = ["0.0.0.0/0"] }
  egress  { from_port = 0  to_port = 0  protocol = "-1" cidr_blocks = ["0.0.0.0/0"] }
}
