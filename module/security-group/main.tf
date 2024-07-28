######################################################################################################################################
#                                              Creating Security group
######################################################################################################################################
resource "aws_security_group" "Recover-access-to-lost-keypair-SG" {
  vpc_id = var.vpc-id
  name = "Recover-access-to-lost-keypair-SG"
  description = "security group for Recover-access-to-lost-keypair"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing SSH connection from Anywhere"
  }
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing RDP connection from Anywhere"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing all ports from Anywhere"
  }

tags = {
  Name = "Recover-access-to-lost-keypair-SG"
}
}