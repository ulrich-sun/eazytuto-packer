output "addresses-public" {
  value = [aws_eip.lb.*.public_ip]
}