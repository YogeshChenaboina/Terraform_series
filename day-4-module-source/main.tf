module "dev" {
  source = "../day-4-modules"
  instance_type = "t2.micro"
  key_name = "my-key-pair"
  ami_name = "ami-068e0f1a600cd311c"
  tags = "my-instance"
}


