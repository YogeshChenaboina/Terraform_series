variable "test" {
  type = list(string)
  default = [ "test_0","dev"]
}
resource "aws_instance" "dev" {
  ami = "ami-025fe52e1f2dc5044"
  instance_type = "t2.micro"
  key_name = "my-key-pair"
#   count = 2
count =length(var.test)
#   tags = {
#     Name="new_instance-${count.index}"
#   }
tags = {
  Name = var.test[count.index]
}
}