variable "ami_name" {
  description = "pass the values to main.tf"
  type = string
  default ="ami-068e0f1a600cd311c"
}

variable "instance_type" {
  description = "pass the values to main.tf"
  type = string
  default =""
}

variable "key_name" {
  description = "pass the values to main.tf"
  type = string
  default ="my-key-pair"
}
