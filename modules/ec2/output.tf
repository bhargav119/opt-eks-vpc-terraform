output "test1_server_ip" {
  value = aws_instance.test1-server.private_ip 
}

output "test2_server_ip" {
  value = aws_instance.test2[0].private_ip
}

output "test3_server_ip" {
  value = aws_instance.test3[0].private_ip
}
