variable "aws_region" {
  type    = string
  default = "us-west-2"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}


variable "my_ip_cidr" {
  type    = string
  default = "105.112.222.215/32" 
}
variable "frontend_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "backend_instance_type" {
  type    = string
  default = "t2.micro"
}
variable "frontend_app_port" {
  type    = number
  default = 80
}
variable "backend_app_port" {
  type    = number
  default = 8000
}
