############################################################################################################################
#                                      Recovery Windows Server
############################################################################################################################
resource "aws_instance" "windows-recovery-instance" {
  ami = var.windows-ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  security_groups = [var.security-group]
  key_name = var.key-name
  associate_public_ip_address = true
  tags = {
    Name = "Recovery Windows Server"
  }

}


############################################################################################################################
#                                      Recovery linux Server
############################################################################################################################
resource "aws_instance" "recovery-linux-server" {
  ami = var.linux-ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  security_groups = [var.security-group]
  key_name = var.key-name
  associate_public_ip_address = true
  tags = {
    Name = "Recovery Linux Server"
  }
}