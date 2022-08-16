output "alb_name" {
    value = aws_lb.webserver_lb.dns_name
}

output "alb_zone_id" {
    value = aws_lb.webserver_lb.zone_id
}