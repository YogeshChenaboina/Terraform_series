//Creation of the Instance

resource "aws_instance" "test" {
    ami = "ami-068e0f1a600cd311c"
    instance_type = "t2.micro"
    key_name = "my-key-pair"
  tags = {
    Name = "My_New_Instance"
}
depends_on = [ aws_s3_bucket.s3_bucket ]
}
//Creation of the s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "yogbunnewbuc"
}





