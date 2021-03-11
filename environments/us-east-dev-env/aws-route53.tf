#---------- us-east-1-dev-env/aws-route53.tf

data "aws_route53_zone" "wren-cloud" {
  name         = "lk.wren.cloud"
}

resource "aws_route53_record" "wren-cloud-record" {
  zone_id = data.aws_route53_zone.wren-cloud.zone_id
  name = "lk.wren.cloud"
  type = "A"

  alias {
    name                   = "aws_elb.main"
    zone_id                = module.alb.alb_id
    evaluate_target_health = true
  }


  latency_routing_policy {
    region = var.aws_region
  }
}