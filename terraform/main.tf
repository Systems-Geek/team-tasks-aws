provider "aws" { region = var.region }
resource "aws_key_pair" "deployer" {
  key_name   = "team-tasks-key"
  public_key = var.public_key_openssh
}
resource "aws_security_group" "app_sg" {
  name = "team-tasks-sg"
  description = "Allow HTTP and SSH"
  ingress { from_port=22 to_port=22 protocol="tcp" cidr_blocks=["0.0.0.0/0"] }
  ingress { from_port=80 to_port=80 protocol="tcp" cidr_blocks=["0.0.0.0/0"] }
  egress { from_port=0 to_port=0 protocol="-1" cidr_blocks=["0.0.0.0/0"] }
}
resource "aws_instance" "app" {
  ami = "ami-0e86e20dae9224db8" # Ubuntu 22.04 in ap-south-1
  instance_type = "t3.micro"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y docker.io
              systemctl enable docker
              systemctl start docker
              EOF
  tags = { Name = "team-tasks-app" }
}
resource "aws_eip" "app_ip" { instance = aws_instance.app.id }
output "public_ip" { value = aws_eip.app_ip.public_ip }
