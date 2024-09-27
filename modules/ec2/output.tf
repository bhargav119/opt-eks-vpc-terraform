output "test1_server_ip" {
  value = aws_instance.hazelcast-servers[0].private_ip     
}

output "test2_server_ip" {
  value = aws_instance.elkserver.private_ip
}
output "test3-server_ip" {
  value = aws_instance.grafana-server.private_ip
}

