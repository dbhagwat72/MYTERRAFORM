data "aws_ami" "windows" {
  most_recent = true
  owners      = ["801119661308"] # Amazon official account ID for Windows AMIs

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
