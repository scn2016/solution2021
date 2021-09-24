output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.external_alb.dns_name
}

output "vpc_id" {
  value       = aws_vpc.external_vpc.vpc_id
  description = "External VPC id info"
}

output "vpc_cidr" {
  value       = aws_vpc.external_vpc.vpc_cidr
  description = "External VPC cidr blocks"
}

output "vpc_route_table_ids" {
  value       = aws_route_table.public_route_table.id
  description = "Public route tables id"
}

output "alb_security_group_id" {
  value       = aws_security_group.alb_sg.id
  description = "ELB SG id"
}

output "werserver_security_group_id" {
  value       = aws_security_group.webserver_sg.id
  description = "Webser SG id"
}

output "database_security_group_id" {
  value       = aws_security_group.database_sg.id
  description = "Database SG id"
}
