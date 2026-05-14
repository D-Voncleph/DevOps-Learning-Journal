# Week 48: EKS Cloud Controller and Network Load Balancers

Today I studied the integration between Kubernetes Services and physical AWS infrastructure, specifically focusing on the `LoadBalancer` service type.

## The Cloud-Native Bridge
In a bare-metal or local environment (like Minikube), requesting a `LoadBalancer` service simply exposes a port or remains pending. However, in Amazon EKS, the cluster is deeply integrated with the AWS API via the Cloud Controller Manager.

## The Provisioning Lifecycle
When a `Service` manifest is applied with `type: LoadBalancer`:
1. The EKS Control Plane assumes its IAM Role to interact with the broader AWS account.
2. It scans the VPC for public subnets containing the specific discovery tag (`kubernetes.io/role/elb = 1`).
3. It provisions a physical AWS Network Load Balancer (NLB) across those subnets.
4. It configures the NLB listener to route external internet traffic directly to the Worker Nodes' dynamic NodePorts.
5. The public DNS of the newly provisioned AWS NLB is injected back into the Kubernetes Service state.

**Architectural Note:** While incredibly powerful for exposing applications, each `LoadBalancer` service creates a dedicated 1-to-1 physical NLB in AWS, which incurs continuous hourly billing. For multi-service micro-architectures, this quickly becomes cost-prohibitive, necessitating a more efficient routing strategy (Ingress).
