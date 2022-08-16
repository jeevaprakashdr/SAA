resource "aws_lb_target_group" "webserver_lb_tg" {
    name = "webserver-lb-tg"
    port = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "webserver_lb_target_group_attachment_1" {
    target_group_arn = aws_lb_target_group.webserver_lb_tg.arn
    target_id = var.webserver_instance_1_id
    port = 80
}

resource "aws_lb_target_group_attachment" "webserver_lb_target_group_attachment_2" {
    target_group_arn = aws_lb_target_group.webserver_lb_tg.arn
    target_id = var.webserver_instance_2_id
    port = 80
}

resource "aws_lb" "webserver_lb" {
    name = "webserver-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = [ var.security_group_id ]
    subnets = [ var.subnet_A_id, var.subnet_B_id]

    tags = {
        Name = "webserver application loadbalancer"
    }
}

resource "aws_lb_listener" "webserver_lb_listener" {
    load_balancer_arn = aws_lb.webserver_lb.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.webserver_lb_tg.arn
    }
}
