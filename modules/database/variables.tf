variable "project_name" {}

variable "vpc_id" {}

variable "private_subnet_ids" {}

variable "db_name" {
  default = "appdb"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "Password123!"
}

variable "db_instance_class" {
  default = "db.t3.micro"
}