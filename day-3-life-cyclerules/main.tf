resource "aws_instance" "test" {
    ami = "ami-068e0f1a600cd311c"
    instance_type = "t2.micro"
    key_name = "my-key-pair"
    availability_zone = "ap-south-1a"
  tags = {
    Name = "dev"
}

#below examples are for lifecycle meta_arguments 

  lifecycle {
    create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
}

# lifecycle {
#   prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
# }

#   lifecycle {
#     ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
#   }
}






