#---------- us-east-1-dev-env/aws-route53.tf

data "aws_route53_zone" "wren-cloud" {
  name         = "lk.wren.cloud"
}

resource "aws_route53_record" "www" {
  //  zone_id = data.aws_route53_zone.wren-cloud.zone_id
  name = "www"
  type = "A"
  zone_id = "Z09956172QK8IIA273D3S"

  alias {
    name                   = module.alb.alb_name.dns_name
    zone_id                = module.alb.alb_id
    evaluate_target_health = true
  }


  latency_routing_policy {
    region = var.aws_region
  }

  set_identifier = "record-${var.aws_region}"
}