output "public_ip" {
  value = aws_instance.instance.public_ip
}

output "public_DNS" {
  value = aws_instance.instance.public_dns
}