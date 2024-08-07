variable "test" {
  type = list(string)
  default = [ "one","three"]
}
resource "aws_instance" "dev" {
  ami = "ami-025fe52e1f2dc5044"
  instance_type = "t2.micro"
  key_name = "my-key-pair"
#   count = 2
for_each =toset(var.test)
tags = {
  Name = each.value # instance will be created by calling the tags from variables
}
}
# Here for loop works as iterations 