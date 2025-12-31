data "aws_availability_zones" "available" {}
locals { azs = slice(data.aws_availability_zones.available.names, 0, var.az_count) }

resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(var.tags, { Name = "${var.name_prefix}-vpc" })
}

resource "aws_subnet" "public" {
  for_each = toset(local.azs)
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet(var.cidr_block, 8, index(local.azs, each.value))
  availability_zone = each.value
  map_public_ip_on_launch = true
  tags = merge(var.tags, { Name = "${var.name_prefix}-public-${each.value}" })
}

output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = [for s in aws_subnet.public : s.id] }
