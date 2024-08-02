resource "aws_instance" "first_instance" {
  ami = var.ami_name
  instance_type = var.instance_type 
  key_name = var.key_name
  tags = {
    Name=var.tags
  }
}