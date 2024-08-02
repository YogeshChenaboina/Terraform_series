# Create VPC
resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My-VPC"
  }
}
# create IG and attach to VPC
resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name ="my-internet-gateway"
  }
}
# create subnet

resource "aws_subnet" "dev" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "My-subnet"
  }
}
# create route table and edit routings
resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name ="my-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }
}


# Assosiate subnets from routes
resource "aws_route_table_association" "dev" {
  subnet_id      = aws_subnet.dev.id
  route_table_id = aws_route_table.dev.id
}
# create security groups
resource "aws_security_group" "dev" {
    vpc_id = aws_vpc.dev.id
  name        = "allow_traffic"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "my-sg"
  }
  ingress {
    description = "tls from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "http"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description = "tls from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "ssh"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description = "tls from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
# launch ec2 instance from custom network
resource "aws_instance" "dev" {
  ami = "ami-068e0f1a600cd311c"
  instance_type = "t2.micro"
  key_name = "my-key-pair"
  subnet_id = aws_subnet.dev.id
  vpc_security_group_ids = [aws_security_group.dev.id]
  tags = {
    Name = "Terraform-Instance"
  }
}

