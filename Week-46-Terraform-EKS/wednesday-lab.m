# Week 46: EKS Network Infrastructure (VPC Module)

Today I began writing the Infrastructure as Code (IaC) to provision an EKS cluster. To maintain a strict zero-cost learning environment, I am writing and validating the enterprise-grade Terraform code locally, but intentionally omitting the final `terraform apply` execution.

## The EKS Network Requirements
Before the EKS module can be called, the underlying Virtual Private Cloud (VPC) must be perfectly formatted. EKS requires:
1. **Multi-AZ Deployment:** Subnets must span at least two Availability Zones to guarantee Control Plane high availability.
2. **NAT Gateways:** If Worker Nodes are placed in private subnets for security, a NAT Gateway is required so the nodes can reach out to the internet to pull container images from ECR or Docker Hub.

## The "Magic" Discovery Tags
The most critical part of the VPC code is the tagging structure. When a developer deploys a `Service` of type `LoadBalancer` inside Kubernetes, the K8s API server scans the AWS account for subnets with specific tags to know where to build the physical AWS Load Balancer.

* **Public Subnets** must be tagged with: `"kubernetes.io/role/elb" = 1`
* **Private Subnets** must be tagged with: `"kubernetes.io/role/internal-elb" = 1`
* **All Subnets** must be tagged with the cluster identifier: `"kubernetes.io/cluster/<cluster-name>" = "shared"`

By utilizing the official `terraform-aws-modules/vpc/aws` module, I was able to inject these tags directly into the subnet creation blocks, ensuring the network is fully prepared to receive the EKS Control Plane.
