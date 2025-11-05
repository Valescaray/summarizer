variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

# variable "ssh_public_key_path" {
#   type    = string
#   default = "C:/Users/hp/Downloads/summarizer-key.pub"

# }
variable "ssh_public_key_path" {
  default = "${path.module}/summarizer-key.pub"
}

variable "my_ip_cidr" {
  type    = string
  default = "105.112.222.215/32" # replace with your IP
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
