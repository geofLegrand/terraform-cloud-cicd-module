
output "server_tag_name" {

  value = aws_instance.server[*].tags["key"]
}
output "server_dns" {

  value = aws_instance.server[*].public_dns
}
output "server_pub_ip" {
  value = aws_instance.server[*].public_ip
}
output "server_prv_ip" {

  value = aws_instance.server[*].private_ip

}

output "server_id" {

  value = aws_instance.server[*].id

}

