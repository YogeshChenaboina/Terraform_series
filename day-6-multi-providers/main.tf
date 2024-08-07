provider "aws" {
  
}
provider "aws" {
  region = "ap-northeast-3"
  alias = "osaka"
}
resource "aws_s3_bucket" "mumbai_buc" {
  bucket = "yogbunnewmumbuc"
}
resource "aws_s3_bucket" "osaka_buc" {
  bucket = "yogbunnewosabuc"
  provider = aws.osaka
}