# Output VPC ID
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.vpc.id
}

# Output Subnet IDs
output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = [for subnet in aws_subnet.subnet : subnet.id]
}

# Output Security Group ID
output "security_group_id" {
  description = "The ID of the created security group"
  value       = aws_security_group.sg.id
}
