variable "windows-ami-id" {
  default = "ami-04d55999748c1974a"
}

variable "instance-type" {
  default = "t3.micro"
}

variable "subnet-id" {
  default = {}
}

variable "security-group" {
  default = {}
}

variable "key-name" {
  default = {}
}

variable "linux-ami-id" {
  default = "ami-046d5130831576bbb"
}

variable "az1" {
  default = "eu-west-2a"
}

variable "windows-root-volume" {
  default = "vol-0601585d9b9f94fa8"
}

variable "linux-root-volume" {
  default = "vol-0c37e5620e02644a5"
}