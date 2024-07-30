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
  default = "vol-0b2db227e79e3b59f"
}

variable "linux-root-volume" {
  default = "vol-03c27a08a23972cdd"
}