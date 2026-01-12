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

```bash
.github/
└── workflows/
    ├── docker-ci-dev.yml
    ├── docker-ci-prod.yml
    ├── terraform-ci-dev.yml
    └── terraform-ci-prod.yml

app/
├── backend/
│   ├── lib/
│   │   └── index.js
│   ├── node_modules/
│   ├── package-lock.json
│   └── package.json
├── threat-composer/
│   └── [all app code copied from original repo]
│
docker/
├── .dockerignore
├── docker-compose.yaml
└── Dockerfile

infra/
├── terraform/
│   ├── backend.tf
│   ├── envs/
│   │   ├── dev/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   │   │   ├── provider.tf
│   │   │   └── terraform.tfvars
│   │   └── prod/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       ├── provider.tf
│   │       └── terraform.tfvars
│   └── modules/
│       ├── acm/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── alb/
│       │   └── submodules/
│       │       ├── listener/
│       │       │   ├── main.tf
│       │       │   ├── variables.tf
│       │       │   └── outputs.tf
│       │       └── target_group/
│       │           ├── main.tf
│       │           ├── variables.tf
│       │           └── outputs.tf
│       ├── ecr/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── ecs/
│       │   └── submodules/
│       │       ├── service/
│       │       │   ├── main.tf
│       │       │   ├── variables.tf
│       │       │   └── outputs.tf
│       │       └── task_definition/
│       │           ├── main.tf
│       │           ├── variables.tf
│       │           └── outputs.tf
│       ├── iam/
│       │   └── submodules/
│       │       ├── alb_role/
│       │       │   ├── main.tf
│       │       │   ├── variables.tf
│       │       │   └── outputs.tf
│       │       ├── ecs_execution_role/
│       │       │   ├── main.tf
│       │       │   ├── variables.tf
│       │       │   └── outputs.tf
│       │       └── ecs_task_role/
│       │           ├── main.tf
│       │           ├── variables.tf
│       │           └── outputs.tf
│       ├── route53/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── security_groups/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       └── vpc/
│           └── submodules/
│               ├── internet_gateway/
│               │   ├── main.tf
│               │   ├── variables.tf
│               │   └── outputs.tf
│               ├── nat_gateway/
│               │   ├── main.tf
│               │   ├── variables.tf
│               │   └── outputs.tf
│               ├── private_subnet/
│               │   ├── main.tf
│               │   ├── variables.tf
│               │   └── outputs.tf
│               ├── public_subnet/
│               │   ├── main.tf
│               │   ├── variables.tf
│               │   └── outputs.tf
│               └── route_tables/
│                   ├── main.tf
│                   ├── variables.tf
│                   └── outputs.tf

.envs
.gitignore
.gitmodules
README.md
screenshots/

```bash







## Infrastructure


### Terraform Modules

* ACM: SSL/TLS certificate management for secure traffic

* ALB: Application Load Balancer with listeners and target groups to route traffic to ECS tasks

* ECR: Docker image repository for storing your Node app images

* ECS: Cluster with services and task definitions running your Node application

* IAM: Roles for ECS tasks and ALB to control access and permissions

* Route 53: DNS records pointing your domain/subdomain to the ALB

* Security Groups: Network access management for ALB and ECS tasks

* VPC: Public and private subnets, NAT Gateway, internet gateway, and route tables for secure and structured networking

* Modules make the infrastructure modular, reusable, and maintainable.



## Application

Dockerfile & docker-compose.yaml: Builds and runs the Node.js app container

app/threat-composer/: Main application code

app/backend/: Backend logic with lib/index.js and Node.js dependencies

Docker images are built and pushed to ECR via GitHub Actions, using commit SHA tags for versioning



## Deployment

### CI/CD Pipeline

#### CI Workflow (docker-ci-dev.yml / docker-ci-prod.yml)

1. Checks out code from the repository

2. Builds Docker image from /app

3. Scans image for vulnerabilities

4. Pushes Docker image to ECR

#### CD Workflow (terraform-ci-dev.yml / terraform-ci-prod.yml)

1. Runs Terraform plan and apply for infrastructure changes

2. Updates ECS service with new Docker image (commit SHA)

3. Performs zero-downtime deployments via ECS Fargate

#### Optional: Manual Destroy (manual-destroy.yml)

* Allows you to destroy resources safely if needed

### Manual Terraform Commands

```bash
cd infra/terraform/envs/dev   # or prod
terraform init
terraform plan
terraform apply -auto-approve

### Running Locally
You can run the Node.js app locally using Docker to test your setup before deploying to AWS:

#### 1. Build the Docker image

```bash
cd app
docker build -t threat-composer-local:latest .


#### 2. Run Container

```bash
docker run -d -p 8080:80 threat-composer-local:latest


#### 3. Test Locally

```bash
curl http://localhost:3000/health


#### You should see:
```bash
{"status":"UP"}


