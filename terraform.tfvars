# You can override default values here if needed
vpc_cidr = "10.1.0.0/16"

vpc_subnets = [
  "10.1.0.0/24",
  "10.1.1.0/24",
  "10.1.2.0/24"
]

security_group_ports = [
  {
    protocol   = "tcp"
    from_port  = 22
    to_port    = 22
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    protocol   = "tcp"
    from_port  = 3306
    to_port    = 3306
    cidr_blocks = ["10.1.0.0/16"]
  }
]
