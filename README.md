🧩 Team Tasks AWS —  𝗘𝗻𝗱-𝘁𝗼-𝗘𝗻𝗱 𝗗𝗲𝘃𝗢𝗽𝘀 𝗜𝗺𝗽𝗹𝗲𝗺𝗲𝗻𝘁𝗮𝘁𝗶𝗼𝗻

This project demonstrates a complete end-to-end DevOps workflow — from development to automated deployment — using Next.js, Supabase, Docker, Terraform, and GitHub Actions.

The goal was to design a small, production-ready web application and deploy it securely on the cloud with full CI/CD automation.

## 🧭 Architecture Diagram

<p align="center">
  <img src="Generated Image October 18, 2025 - 11_37AM (1).png" 
       alt="End-to-End Deployment: Supabase to AWS EC2 via GitHub Actions" width="800"/>
</p>

🚀 Overview

Team Tasks is a minimal authenticated task management app where each user can securely create, view, and manage their own tasks.
The project highlights best practices in infrastructure automation, containerization, and secure continuous deployment.

✨ Features

🔐 Authentication — Supabase Auth (Email OTP / Magic Link).

🧾 Task Management (CRUD) — Create, Read, Update, Delete user-specific tasks.

🔒 Row Level Security (RLS) — Users can access only their own data.

🐳 Containerized Deployment — Multi-stage Docker build for optimized production images.

☁️ Infrastructure as Code — AWS EC2 provisioning and networking via Terraform.

⚙️ CI/CD Automation — GitHub Actions pipeline for build, push, and deploy with zero downtime.

🧠 Tech Stack
Layer	Tools / Services
Frontend	Next.js (App Router)
Backend	Supabase (Auth + Database + Policies)
Containerization	Docker
Infrastructure	Terraform on AWS
CI/CD	GitHub Actions
Cloud Provider	AWS EC2
Database	PostgreSQL (Supabase)
📸 Demonstration

🎥 GitHub Actions in Action: Automated build and deployment pipeline.

🖼️ Architecture Diagram: Overview of cloud + CI/CD workflow.

🖥️ Web App Interface: Authenticated user dashboard with task management.

(Add screenshots / videos in your repo here)

🧰 Setup (Brief)
# Clone the repository
git clone https://github.com/<your-username>/team-tasks-devops.git
cd team-tasks-devops

# Environment variables
cp .env.example .env.local  # Update Supabase and other credentials

# Run locally (Docker)
docker compose up --build

# Deploy infrastructure (Terraform)
cd terraform
terraform init
terraform apply

🔐 Configuration & Secrets

All sensitive environment variables (Supabase keys, SSH credentials, etc.) are securely managed via GitHub Encrypted Secrets in the CI/CD pipeline.

📦 CI/CD Workflow Summary

Triggered on push to main or manual dispatch.

Builds and pushes Docker image to GitHub Container Registry (GHCR).

Securely connects to AWS EC2 instance via SSH.

Pulls and restarts container with minimal downtime.

🏁 Outcome

This project showcases practical DevOps implementation, integrating:

Secure backend policies (Supabase)

Infrastructure as Code (Terraform)

Containerized deployments (Docker)

Automated CI/CD workflows (GitHub Actions)

It’s a demonstration of how to take a small web app from local development to production — the DevOps way.
