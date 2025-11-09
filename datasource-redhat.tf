data "aws_ami" "rhel" {
  most_recent = true
  owners      = ["309956199498"] # Red Hat official AWS account ID

  filter {
    name   = "name"
    values = ["RHEL-9.*_HVM-*-x86_64-*"] # Or use "RHEL-8*" or "RHEL-7*"
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
