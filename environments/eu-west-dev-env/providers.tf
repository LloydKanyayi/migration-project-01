
#---------providers/main.tf

provider "aws" {
  region                   = var.aws_region
  shared_credentials_file  = "/Users/lloyd.kanyayi/.aws/creds"
  profile                  = "customprofile"
}