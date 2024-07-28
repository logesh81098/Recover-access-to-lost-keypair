output "vpc-id" {
  value = aws_vpc.Recover-access-to-lost-keypair.id
}

output "public-subnet-id" {
  value = aws_subnet.public-subnet.id
}