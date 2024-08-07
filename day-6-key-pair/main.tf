resource "aws_key_pair" "test" {
  key_name = "keypair"
  public_key = file("~/.ssh/id_rsa.pub") #here You need to define the publickey file
}

resource "aws_instance" "dev" {
  ami = "ami-025fe52e1f2dc5044"
  instance_type = "t2.micro"
  key_name = aws_key_pair.test.key_name
  tags = {
    Name="Key-pair-Instance"
  }
}

