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

High-level Traffic Flow

* ALB: Public-facing load balancer routing traffic to ECS tasks

ECS Tasks: Runs threat-composer Docker containers in private subnets

NAT Gateway: Provides outbound internet access for ECS tasks

ECR: Stores Docker images for deployment

Terraform Modules: Modular, reusable infrastructure for maintainability


## Folder Structure
-pic 


