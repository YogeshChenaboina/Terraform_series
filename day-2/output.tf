output "ec2_public_ip" {
  value = aws_instance.first_instance.public_ip
  description = "print the public IP"
}

output "ec2_private_ip" {
  value = aws_instance.first_instance.private_ip
  description = "print the private IP"
}