# Week 48: The AWS Load Balancer Controller and Ingress

Today I studied the architectural solution to the 1-to-1 LoadBalancer billing problem: Kubernetes Ingress routing via the AWS Load Balancer Controller.

## The Cost of Layer 4 Routing
Using `type: LoadBalancer` on individual Kubernetes Services provisions dedicated Layer 4 Network Load Balancers (NLBs) in AWS. For a microservice architecture with dozens of exposed endpoints, this creates unsustainable infrastructure costs.

## The Layer 7 Solution (ALB Ingress)
The enterprise standard is to consolidate external traffic through a single entry point using Layer 7 (HTTP/HTTPS) routing. 

1. **Service Isolation:** All application services are reverted to internal-only types (`NodePort` or `ClusterIP`).
2. **The Ingress Rulebook:** A Kubernetes `Ingress` object is created to define path-based routing rules (e.g., routing `/api` to the backend service and `/` to the frontend service).
3. **The Controller:** The `AWS Load Balancer Controller` is installed into the cluster. This controller watches for `Ingress` objects and automatically provisions a single AWS Application Load Balancer (ALB).

The ALB acts as a smart router, dynamically forwarding traffic to the correct internal Pods based on the URL path. This architecture allows an organization to securely expose an unlimited number of microservices to the public internet through a single, cost-effective AWS infrastructure component.
