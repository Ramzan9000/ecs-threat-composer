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



