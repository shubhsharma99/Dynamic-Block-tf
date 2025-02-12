# VPC CIDR Block
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
 
}

# Subnet CIDR Blocks
variable "vpc_subnets" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)

}

# # Security Group Rules (Default Ports)
# variable "security_group_ports" {
#   description = "List of security group ingress and egress rules"
#   type = list(object({
#     protocol   = string
#     from_port  = number
#     to_port    = number
#     cidr_blocks = list(string)
#   }))
#   default = [
#     {
#       protocol   = "tcp"
#       from_port  = 80
#       to_port    = 80
#       cidr_blocks = ["0.0.0.0/0"]
#     },
#     {
#       protocol   = "tcp"
#       from_port  = 443
#       to_port    = 443
#       cidr_blocks = ["0.0.0.0/0"]
#     },
#     {
#       protocol   = "tcp"
#       from_port  = 1433
#       to_port    = 1433
#       cidr_blocks = ["10.0.0.0/16"]
#     }
#   ]
# }
# Security Group Rules (No Default Ports)
variable "security_group_ports" {
  description = "List of security group ingress and egress rules"
  type = list(object({
    protocol   = string
    from_port  = number
    to_port    = number
    cidr_blocks = list(string)
  }))
}
