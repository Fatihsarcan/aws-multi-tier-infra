variable "project_name" {}

variable "vpc_id" {}

variable "public_subnet_ids" {}

variable "private_subnet_ids" {}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  # Amazon Linux 2 - eu-central-1
  default = "ami-0669b163befffbdfc"
}