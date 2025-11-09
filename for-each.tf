variable "instance_names" {
  default = ["AppServer", "DBServer", "CacheServer"]
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  for_each      = toset(var.instance_names)

  tags = {
    Name = each.key
  }
}
