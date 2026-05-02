# Week 46: Infrastructure as Code for EKS

Today I began the final phase of my cloud orchestration curriculum: provisioning Amazon EKS using Terraform.

## The Limitation of CLI Tools
While tools like `eksctl` are excellent for rapid cluster bootstrapping, they are disconnected from the broader Infrastructure as Code (IaC) state. For enterprise-grade architecture, the Kubernetes cluster must be deployed alongside the rest of the AWS networking and database infrastructure using a unified Terraform state.

## The Official EKS Module
Provisioning EKS natively in Terraform requires immense complexity, specifically regarding IAM role associations and Worker Node security group rules. To abstract this complexity, I will be utilizing the official AWS EKS Terraform module (`terraform-aws-modules/eks/aws`). 

By leveraging this module, I can declaratively define my Control Plane and Managed Node Groups in a concise, readable format while the module handles the underlying CloudFormation and API complexity.
