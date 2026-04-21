# Week 45: EKS Network Architecture and Node Groups

Today I studied the network architecture of Amazon EKS, specifically how the cluster bridges AWS-managed infrastructure with customer-managed compute resources.

## The Dual-VPC Architecture
An EKS cluster does not exist within a single network boundary. It is structurally divided across two Virtual Private Clouds (VPCs):

1. **The Control Plane (AWS VPC):** * AWS hosts the API Server and `etcd` in a hidden, AWS-owned VPC.
   * This infrastructure is deployed across multiple Availability Zones for fault tolerance.
   * It connects to the customer network via Cross-Account Elastic Network Interfaces (ENIs).

2. **The Data Plane (Customer VPC):**
   * The actual compute resources live in the customer's AWS account.
   * These resources are organized into **Node Groups**, which are Auto Scaling Groups of standard EC2 instances configured to act as K8s Worker Nodes.
   * Upon boot, the `kubelet` on these EC2 instances utilizes the Cross-Account ENIs to register with the AWS-managed API Server.

## Security and Isolation
This strict network isolation prevents customer-side network misconfigurations (such as broken route tables or aggressive Security Groups in the customer VPC) from bringing down the core Kubernetes Control Plane.
