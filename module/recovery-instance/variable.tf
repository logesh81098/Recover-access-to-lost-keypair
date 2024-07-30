variable "instance-type" {
  default = "t3.micro"
}

variable "windows-ami-id" {
  default = "ami-04d55999748c1974a"
}

variable "linux-ami-id" {
  default = "ami-046d5130831576bbb"
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

variable "az1" {
  default = "eu-west-2a"
}