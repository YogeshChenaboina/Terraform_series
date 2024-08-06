resource "aws_s3_bucket" "target" {
    bucket = "ytvhshfbbcaa" 
}

resource "aws_instance" "test" {
    ami = "ami-025fe52e1f2dc5044"
    instance_type = "t2.micro"
    key_name = "my-key-pair"
    tags = {
      Name="Target-resource-server"
    }
}