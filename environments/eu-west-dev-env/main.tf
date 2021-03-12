#---------- eu-west-dev-env/main.tf

module "networking" {
  source   = "../../modules/networking"
  vpc_cidr = "10.0.0.0/16"
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

  cluster_name = var.cluster_name
  container_name = var.container_name
  ecs_family_name = var.ecs_family_name
  ecs_security = var.ecs_security
  ecs_service = var.ecs_service
  iam_role_name = var.iam_role_name
}

