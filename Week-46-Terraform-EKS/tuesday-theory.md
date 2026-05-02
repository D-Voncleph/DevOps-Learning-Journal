# Week 46: EKS Identity and Access Management (IAM)

Today I studied the Identity and Access Management (IAM) architecture required to run Amazon EKS securely. 

## The Zero Trust Architecture
AWS operates on a principle of least privilege. Components of an EKS cluster must be explicitly granted IAM Roles to interact with the broader AWS ecosystem. 

## The Two Critical IAM Roles
1. **The EKS Cluster Role (Control Plane):**
   The AWS-managed API server requires permissions to manage infrastructure within the customer VPC. For example, if a developer deploys a LoadBalancer Service, the Control Plane assumes this IAM Role to dynamically provision an AWS Elastic Load Balancer (ELB).
2. **The Worker Node Role (Data Plane):**
   The EC2 instances executing the workloads require their own dedicated IAM Role. This grants the `kubelet` process the authorization to securely register with the cluster, assign AWS-routable IP addresses to Pods via the VPC CNI, and pull container images from Amazon Elastic Container Registry (ECR).

While I am using the official Terraform EKS module to automate the creation of these policies, understanding this underlying IAM structure is critical for debugging permission errors when integrating K8s workloads with external AWS services (like S3 or DynamoDB).
