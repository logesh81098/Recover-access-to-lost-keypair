#######################################################################################################################################
#                                           Creating First Key pair
#######################################################################################################################################
resource "tls_private_key" "original-key" {
  rsa_bits = 4096
  algorithm = "RSA"
}


resource "aws_key_pair" "original-key" {
  public_key = tls_private_key.original-key.public_key_openssh
  key_name = "Recover-access-to-lost-keypair"
}

resource "local_file" "original-key" {
  filename = "Recover-access-to-lostoriginal-pem"
  content = tls_private_key.original-key.private_key_pem
}
