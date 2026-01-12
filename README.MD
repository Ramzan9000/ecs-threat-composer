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

This project deploys Threat Composer, a containerized application, on AWS ECS Fargate using Terraform.

Key features:

* Containerized deployment using Docker

* ECS Fargate for serverless container execution

* Public-facing Application Load Balancer (ALB) routing to ECS tasks

* Infrastructure as code with reusable Terraform modules

* CI/CD pipeline with GitHub Actions for automated builds and pushes

* AWS infrastructure includes VPC, NAT Gateway, ALB, ECS, ECR, IAM roles, Security Groups

## Architecture
-pic

High-level Traffic Flow

* ALB: Public-facing load balancer routing traffic to ECS tasks

* ECS Tasks: Runs threat-composer Docker containers in private subnets

* NAT Gateway: Provides outbound internet access for ECS tasks

* ECR: Stores Docker images for deployment

* Terraform Modules: Modular, reusable infrastructure for maintainability


## Folder Structure

threat-composer/
├── .github/
│ └── workflows/
│ ├── docker-ci-dev.yml
│ ├── docker-ci-prod.yml
│ ├── terraform-ci-dev.yml
│ └── terraform-ci-prod.yml
│
├── app/
│ ├── threat-composer/ # Copied Node app code
│ └── backend/
│ ├── lib/
│ │ └── index.js
│ ├── node_modules/
│ ├── package-lock.json
│ └── package.json
│
├── docker/
│ ├── .dockerignore
│ ├── docker-compose.yaml
│ └── Dockerfile
│
├── infra/
│ └── terraform/
│ ├── backend.tf
│ ├── envs/
│ │ ├── dev/
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ ├── outputs.tf
│ │ │ ├── provider.tf
│ │ │ └── terraform.tfvars
│ │ └── prod/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
│ │ ├── provider.tf
│ │ └── terraform.tfvars
│ └── modules/
│ ├── acm/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── alb/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
│ │ └── submodules/
│ │ ├── listener/
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ └── outputs.tf
│ │ └── target_group/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── ecr/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── ecs/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
│ │ └── submodules/
│ │ ├── service/
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ └── outputs.tf
│ │ └── task_definition/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── iam/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ ├── outputs.tf
│ │ └── submodules/
│ │ ├── alb_role/
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ └── outputs.tf
│ │ ├── ecs_execution_role/
│ │ │ ├── main.tf
│ │ │ ├── variables.tf
│ │ │ └── outputs.tf
│ │ └── ecs_task_role/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── route53/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── security_groups/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── vpc/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── submodules/
│ ├── internet_gateway/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── nat_gateway/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── private_subnet/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── public_subnet/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── route_tables/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│
├── .envs
├── .gitignore
├── .gitmodules
├── README.md
└── screenshots/






