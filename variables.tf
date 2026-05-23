variable "aws_region" {
  default = "eu-central-1"
}

variable "project_name" {
  default = "multi-tier-app"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  default = ["eu-central-1a", "eu-central-1b"]
}