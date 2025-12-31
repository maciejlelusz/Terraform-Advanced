data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
  filter { name = "name" values = ["al2023-ami-*-x86_64"] }
}

resource "aws_security_group" "web" {
  name = "${var.name_prefix}-lab03-web"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  ingress { from_port = 80 to_port = 80 protocol = "tcp" cidr_blocks = ["0.0.0.0/0"] }
  egress  { from_port = 0  to_port = 0  protocol = "-1" cidr_blocks = ["0.0.0.0/0"] }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.al2023.id
  instance_type = var.instance_type
  subnet_id     = tolist(data.terraform_remote_state.network.outputs.public_subnet_ids)[0]
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data = <<-EOF
    #!/bin/bash
    dnf -y install httpd
    echo "lab03: hello from $(hostname)" > /var/www/html/index.html
    systemctl enable --now httpd
  EOF
  tags = { Name = "${var.name_prefix}-lab03-web" }
}

output "instance_public_ip" { value = aws_instance.web.public_ip }
