variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t3.micro", "c4.large"]
}

variable "instance_type_index" {
  type    = number
  default = 0
}

# Map of region to AMI IDs (Amazon Linux 2 AMI)
variable "region_ami_map" {
  type = map(string)
  default = {
    "us-east-1"      = "ami-0c55b159cbfafe1f0"
    "us-west-1"      = "ami-0bdb828fd58c52235"
    "us-west-2"      = "ami-08962a4068733a2b6"
    "eu-central-1"   = "ami-0233214e13e500f77"
    "ap-south-1"     = "ami-03f4878755434977f"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "map-example" {
  ami           = var.region_ami_map[var.region]
  instance_type = var.instance_types[var.instance_type_index]

  tags = {
    Name = "map-EC2-example"
  }
}
