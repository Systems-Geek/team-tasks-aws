provider "aws" {
  region = "ap-south-1" # adjust if needed
}

# Fetch default VPC
data "aws_vpc" "default" {
  default = true
}

# 🌐 Security Group for Web Server
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH, HTTP, HTTPS"
  vpc_id      = data.aws_vpc.default.id   # 🔹 replace with your default VPC ID

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 💻 EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-08e5424edfe926b43"  # Ubuntu 22.04 in ap-south-1 (Mumbai) ✅
  instance_type = "t2.micro"
  key_name      = "web-key"                 # 🔹 existing key in AWS
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Terraform-Web-Server"
  }
}

# 📡 Elastic IP
resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
#  vpc      = true
}

# 📤 Outputs
output "instance_id" {
  value = aws_instance.web.id
}

output "instance_public_ip" {
  value = aws_eip.web_eip.public_ip
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}
