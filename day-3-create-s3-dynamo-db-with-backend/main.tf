resource "aws_instance" "my_instance" {
  ami = var.ami-name
  instance_type = var.instance-type
  key_name = var.key-name
  tags = {
    Name ="Terraform_Instance"
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "yogubuckethyd"
}

resource "aws_dynamodb_table" "dynamo_table" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}