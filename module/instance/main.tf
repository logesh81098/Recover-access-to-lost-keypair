#######################################################################################################################################
#                                            Deploying Windows EC2 instance
#######################################################################################################################################
resource "aws_instance" "Windows-instance" {
  ami = var.windows-ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  security_groups = [var.security-group]
  key_name = var.key-name
  associate_public_ip_address = true
  tags = {
    Name = "Windows server"
  }
}


#######################################################################################################################################
#                                            Deploying Linux EC2 instance
#######################################################################################################################################
resource "aws_instance" "Linux-server" {
  ami = var.linux-ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  security_groups = [var.security-group]
  key_name = var.key-name
  associate_public_ip_address = true
  tags = {
    Name =  "Linux Server"
  }
}