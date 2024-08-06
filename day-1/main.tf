resource "aws_instance" "dev" {
  ami = var.ami_name
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name="my_instance"
  }
}

