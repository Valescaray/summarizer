# Frontend SG: HTTP/HTTPS from anywhere, SSH from your IP
resource "aws_security_group" "frontend_sg" {
  name   = "summarizer-frontend-sg"
  vpc_id = aws_vpc.main.id
  description = "Frontend SG"

  ingress {
    from_port = var.frontend_app_port
    to_port   = var.frontend_app_port
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }
  egress { 
    from_port=0
    to_port=0 
    protocol="-1"
    cidr_blocks=["0.0.0.0/0"] 
    }

  tags = { Name = "frontend-sg" }
}

# Backend SG: App port from anywhere, SSH from anywhere
resource "aws_security_group" "backend_sg" {
  name   = "summarizer-backend-sg"
  vpc_id = aws_vpc.main.id
  description = "Backend SG"

  ingress {
    from_port = var.backend_app_port
    to_port   = var.backend_app_port
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }
  egress {
     from_port=0
     to_port=0
      protocol="-1"
     cidr_blocks=["0.0.0.0/0"] 
     }

  tags = { Name = "backend-sg" }
}
