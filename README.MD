# Threat Composer Project

## Table of Contents
- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Folder Structure](#folder-structure)
- [Infrastructure](#infrastructure)
- [Application](#application)
- [Deployment](#deployment)
- [Testing](#testing)
- [Authors](#authors)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Project Overview
Brief description of what the project does and why it exists. - pic 

## Architecture
High-Level Traffic Flow

Application Load Balancer (ALB):

Public-facing load balancer that routes incoming traffic to your ECS tasks

Handles scaling and distributes requests across containers

ECS Tasks (Docker Containers):

Runs your Dockerized application (threat-composer) in private subnets

Tasks pull images from ECR and are orchestrated by ECS cluster

Elastic Container Registry (ECR):

Stores Docker images for deployment

Ensures ECS tasks always have the latest container version

NAT Gateway:

Provides outbound internet access for ECS tasks in private subnets

Ensures secure connectivity without exposing private containers to the public

VPC & Subnets:

Public subnets: Host ALB and NAT gateways

Private subnets: Host ECS tasks securely

Security Groups:

Control traffic to and from ALB and ECS tasks

Ensure only allowed ports are exposed (e.g., 8080 → 80 internally)

Terraform Modules:

Infrastructure as code is modular and reusable

Modules include VPC, ECS, ALB, IAM, and (optionally) Route53 & ACM

Enables consistent, maintainable, and scalable deployments

(Optional Route53 & ACM – commented out):

Route53 would manage DNS records pointing a custom domain to ALB

ACM would provide SSL/TLS certificates for HTTPS traffic
## Folder Structure
-pic 
