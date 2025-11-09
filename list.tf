provider "aws" {
  region = "ap-south-1"
}

variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t3.micro", "c4.large"]
}



resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = var.instance_types[0]

  tags = {
    Name = "MyEC2"
  }
}
