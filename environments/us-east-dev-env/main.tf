#-------------root/main.tf


module "providers" {
  source     = "../../modules/providers"
  aws_region = var.us_region
}

module "networking" {
  source   = "../../modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "alb" {
  source         = "../../modules/alb"
  aws_vpc        = module.networking.vpc_id
  public_subnets = module.networking.subnet_id_public
}

module "ecs-fargate" {
  source                   = "../../modules/ecs-fargate"
  aws_alb_target_group_arn = module.alb.aws_alb_target_group_arn
  private_subnets          = module.networking.subnet_id_private
  vpc_id                   = module.networking.vpc_id

  alb_listener_front_end = module.alb.alb_listener_front_end
}