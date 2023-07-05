output "instance_ip_addr" {
  value = aws_instance.instance.private_ip
   }

output "instance_public_ip_addr" {
  value = aws_instance.instance.public_ip
   }

output "db_instance_addr" {
  value = aws_rds_cluster.aurora_db_cluser.endpoint
}
