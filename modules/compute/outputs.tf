output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "alb_arn" {
  value = aws_lb.main.arn
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2.id
}