# Week 46: EKS Cluster Infrastructure (EKS Module)

Today I drafted the core Control Plane and Data Plane architecture using the official Terraform EKS module (`terraform-aws-modules/eks/aws`), successfully linking it to the VPC provisioned yesterday.

## Architectural Abstraction
By utilizing the official module, I abstracted hundreds of lines of complex CloudFormation and IAM policy documents into a single declarative block. 

1. **Network Integration:** The cluster dynamically retrieves its placement logic by referencing the outputs of the VPC module (`module.vpc.vpc_id` and `module.vpc.private_subnets`), ensuring the Worker Nodes are placed securely within the private network tier.
2. **Managed Node Groups:** Instead of manually configuring EC2 Launch Templates, Auto Scaling Groups (ASGs), and the required Worker Node IAM roles, the `eks_managed_node_groups` block handles this natively. I configured a standard worker pool of two `t3.medium` instances.
3. **IAM Automation:** The module automatically generates the strict, least-privilege IAM roles required for the Control Plane (to manage AWS resources) and the Kubelet (to pull from ECR and assign VPC IP addresses).

I executed `terraform init` and `terraform validate` to verify the syntax and module integration. The architecture is mathematically sound and ready for deployment, though execution will be paused to maintain a strict zero-cost learning environment.
