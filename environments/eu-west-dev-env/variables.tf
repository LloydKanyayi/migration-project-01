#---------- eu-west-dev-env/variables.tf


variable "aws_region" {
  default = "eu-west-1"
}


variable "cluster_name" {
  default = "myapp-cluster-eu-west-1"
}


variable "ecs_service" {
  default = "myapp-service-eu-west-1"
}


variable "container_name" {
default = "my-first-app-eu-west-1"
}


variable "ecs_family_name" {
default = "myapp-task-eu-west-1"
}

variable "ecs_security" {
default ="ecs-security-eu-west-1"
}


variable "iam_role_name" {
default = "my-app-role-eu-west-1"
}