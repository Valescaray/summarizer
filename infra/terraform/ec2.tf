data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# IAM Role for EC2 to access ECR
resource "aws_iam_role" "summarizer_ec2_role" {
  name = "summarizer-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach ECR Read-Only Access to the Role
resource "aws_iam_role_policy_attachment" "ecr_read_access" {
  role       = aws_iam_role.summarizer_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# Create Instance Profile for EC2
resource "aws_iam_instance_profile" "summarizer_profile" {
  name = "summarizer-ec2-profile"
  role = aws_iam_role.summarizer_ec2_role.name
}

resource "aws_instance" "frontend" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.frontend_instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]
  key_name               = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  iam_instance_profile    = aws_iam_instance_profile.summarizer_profile.name

  tags = { Name = "summarizer-frontend" }
}

resource "aws_instance" "backend" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.backend_instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  key_name               = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  iam_instance_profile    = aws_iam_instance_profile.summarizer_profile.name

  tags = { Name = "summarizer-backend" }
}



# # Frontend EC2
# resource "aws_instance" "frontend" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = var.frontend_instance_type
#   subnet_id              = aws_subnet.public.id
#   vpc_security_group_ids = [aws_security_group.frontend_sg.id]
#   key_name               = aws_key_pair.deployer.key_name
#   associate_public_ip_address = true

 

#   tags = { Name = "summarizer-frontend" }
# }

# # Backend EC2
# resource "aws_instance" "backend" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = var.backend_instance_type
#   subnet_id              = aws_subnet.public.id
#   vpc_security_group_ids = [aws_security_group.backend_sg.id]
#   key_name               = aws_key_pair.deployer.key_name
#   associate_public_ip_address = true

 

#   tags = { Name = "summarizer-backend" }
# }
