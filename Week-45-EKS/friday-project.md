# Week 45 Project: Remote Cloud Deployment

Today I successfully deployed the FinTech application architecture to a remote cloud Kubernetes cluster, proving the portability of declarative Infrastructure as Code.

## The Deployment Execution
Utilizing the ephemeral Killercoda cloud sandbox, I first verified the cloud data plane using `kubectl get nodes`. 

Instead of manually recreating manifests, I leveraged Git to pull my version-controlled infrastructure directly into the remote environment:
`git clone https://github.com/<username>/kubernetes-fintech-app.git`

Following the established deployment runbook, I applied the State/Security manifests, followed by the Data tier, and finally the Presentation tier. 

## Architectural Validation
Running `kubectl get all` confirmed that the remote Control Plane successfully parsed the YAML manifests, scheduled the Pods onto the cloud Worker Nodes, and established the internal ClusterIP and external NodePort networking. This exercise proves that decoupling configuration from application code allows the exact same Docker images and YAML manifests to be deployed seamlessly across any Kubernetes environment, from a local Minikube sandbox to a remote cloud data center.
