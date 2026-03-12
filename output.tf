output "ec2_public" {
  value = aws_instance.example.public_ip
}