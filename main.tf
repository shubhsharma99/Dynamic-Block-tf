# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "MainVPC"
  }
}

# Create Subnets using for_each
resource "aws_subnet" "subnet" {
  for_each = toset(var.vpc_subnets)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value

  tags = {
    Name = "Subnet-${each.value}"
  }
}

# # Create Security Group with dynamic ingress and egress rules
resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.vpc.id
  name        = "webserver-sg"
  description = "Security Group for Web Servers"

  # Dynamic block for ingress rules (inbound traffic)
  dynamic "ingress" {
    for_each = var.security_group_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # Dynamic block for egress rules (outbound traffic)
  dynamic "egress" {
    for_each = var.security_group_ports
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "WebServerSG"
  }
}
