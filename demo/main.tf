provider "aws" {
  
}
resource "aws_instance" "dev" {
  ami = "ami-025fe52e1f2dc5044"
  instance_type = "t2.micro"
  key_name = "my-key-pair"
  tags = {
    Name ="my-new-instance"
  }
}