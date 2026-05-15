# Week 48 Project: Live Application Routing Validation

Today, I executed the final validation of my Kubernetes networking architecture by accessing the internal FinTech frontend through a live, external Layer 7 Ingress route.

## Execution and Validation
To validate the Ingress rulebook authored yesterday, I rapidly redeployed the NGINX Ingress Controller, a standard frontend deployment, and the declarative `Ingress` routing manifest. 

Because I am operating in a cloud-agnostic bare-metal sandbox rather than AWS, the controller binds to the host via a `NodePort` rather than an external ALB DNS name. 
1. I executed `kubectl get svc -n ingress-nginx ingress-nginx-controller` to dynamically retrieve the assigned external routing port.
2. Utilizing the external port, I simulated public internet access by initiating an HTTP request from a web browser directly to the cluster's edge.

The request successfully bypassed the internal cluster isolation and resolved the frontend application. This project completely validates the Layer 7 routing architecture. The application is now securely isolated internally while being globally accessible through a single, intelligent ingress controller, proving readiness for enterprise-scale traffic.
