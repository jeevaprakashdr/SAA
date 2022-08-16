resource "aws_route53_zone" "webserver_dns_zone" {
    name = "kelasamadumadava.link"
}

resource "aws_route53_record" "name" {
    zone_id = aws_route53_zone.webserver_dns_zone.id
    name = "test.kelasamadumadava.link"
    type = "A"
        
    alias {
        name = var.alb_name
        zone_id = var.alb_zone_id
        evaluate_target_health = true
    }
} 