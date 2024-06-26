output "addresses-public" {
  value = [aws_instance.myec2.*.public_ip]
}