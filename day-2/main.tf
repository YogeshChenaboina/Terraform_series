resource "aws_instance" "first_instance" {
  ami = var.ami_name
  instance_type = var.instance_type 
  key_name = var.key_name
  tags = {
    Name="myInstance"
  }
}

resource "aws_instance" "second_instance" {
  ami = var.ami_name
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "second_server"
  }
}
