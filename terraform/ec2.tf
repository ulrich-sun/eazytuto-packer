resource "aws_instance" "myec2" {
  count = var.number
  ami             = "ami-0a8b1d01fb46008e6" # CentOS 7
  instance_type   = "t2.medium"              # you can change this
  security_groups = ["eazytuto-sg"]
  tags = {
    Name = "machine-${count.index}"
  }

  root_block_device {
    volume_size = var.stockage # you can change this value
  }
}