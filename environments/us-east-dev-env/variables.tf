#---------- eu-west-dev-env/variables.tf


variable "aws_region" {
  default = "us-east-1"
}


variable "cluster_name" {
  default = "myapp-cluster-us-east-1"
}


variable "ecs_service" {
  default = "myapp-service-us-east-1"
}


variable "container_name" {
  default = "my-first-app-us-east-1"
}


variable "ecs_family_name" {
  default = "myapp-task-us-east-1"
}

variable "ecs_security" {
  default ="ecs-security-us-east-1"
}


variable "iam_role_name" {
  default = "my-app-role-us-east-1"
}

