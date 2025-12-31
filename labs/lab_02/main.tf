data "aws_availability_zones" "available" {}
locals { azs = slice(data.aws_availability_zones.available.names, 0, 2) }

resource "aws_vpc" "this" {
  cidr_block = "10.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = "${var.name_prefix}-vpc" }
}

resource "aws_internet_gateway" "igw" { vpc_id = aws_vpc.this.id tags = { Name = "${var.name_prefix}-igw" } }

resource "aws_subnet" "public" {
  for_each = toset(local.azs)
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet("10.20.0.0/16", 8, index(local.azs, each.value))
  availability_zone = each.value
  map_public_ip_on_launch = true
  tags = { Name = "${var.name_prefix}-public-${each.value}" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route { cidr_block = "0.0.0.0/0" gateway_id = aws_internet_gateway.igw.id }
  tags = { Name = "${var.name_prefix}-public-rt" }
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public
  subnet_id = each.value.id
  route_table_id = aws_route_table.public.id
}

output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_ids" { value = [for s in aws_subnet.public : s.id] }
