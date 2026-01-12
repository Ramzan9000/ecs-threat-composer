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

Docker images are built and pushed to ECR via GitHub Actions, using commit SHA tags for versioning.
