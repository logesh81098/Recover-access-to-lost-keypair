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

resource "aws_ebs_volume" "windows-secondary-volume" {
  size = 10
  availability_zone = var.az1
  tags = {
    Name = "Secondary Windows Volume"
  }
}

resource "aws_volume_attachment" "secondary-windows-volume-attachment" {
  volume_id = aws_ebs_volume.windows-secondary-volume.id
  instance_id = aws_instance.Windows-instance.id
  device_name = "/dev/sdh"
}

###########################################################################################################################
#                                Taking snapshot of volume and creating new volume from that snapshot             
############################################################################################################################
# To take snapshot of root volume first we need to know either anyone of the below:
        #Volume ID (we can directly use aws_ebs_snapshot to take snapshot just by providing volume ID)
        # Instance ID (Using "Data" function we can get the volume ID by mentioning the Instance ID)
#So Now we go with Volume ID
resource "aws_ebs_snapshot" "windows-root-volume-snapshot" {
  volume_id = var.windows-root-volume
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

resource "aws_ebs_volume" "linux-secondary-volume" {
  size = 10
  availability_zone = var.az1
  }

resource "aws_volume_attachment" "linux-secondary-volume-attachment" {
  volume_id = aws_ebs_volume.linux-secondary-volume.id
  instance_id = aws_instance.Linux-server.id
  device_name = "/dev/sdh"
}

resource "aws_ebs_snapshot" "linux-root-volume-snapshot" {
  volume_id = var.windows-root-volume
}