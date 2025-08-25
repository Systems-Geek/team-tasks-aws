variable "aws_region" {
  default = "ap-south-2"
}

variable "project" {
  default = "web-app"
}

variable "environment" {
  default = "dev"
}

variable "key_name" {
  default = "web-key"
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  default     = "~/.ssh/id_ed25519.pub"
}

variable "instance_type" {
  description = "EC2 instance type (t2.micro = free tier)"
  default     = "t2.micro"
}

variable "ssh_cidr" {
  description = "CIDR block for SSH access"
  default     = "0.0.0.0/0"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI for ap-south-2"
  default     = "ami-0f58b397bc5c1f2e8" # update if outdated
}
