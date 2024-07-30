module "vpc" {
  source = "./module/vpc"
}

module "security-group" {
  source = "./module/security-group"
  vpc-id = module.vpc.vpc-id
}


module "keypair" {
  source = "./module/keypair"
}

module "instance" {
  source = "./module/instance"
  subnet-id = module.vpc.public-subnet-id
  security-group = module.security-group.security-group-id
  key-name = module.keypair.orinial-key
}

module "recovery-instance" {
  source = "./module/recovery-instance"
  subnet-id = module.vpc.public-subnet-id
  security-group = module.security-group.security-group-id
  key-name = module.keypair.orinial-key
}