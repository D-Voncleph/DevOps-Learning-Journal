# Week 41 Project: Architecting a Multi-Tier Network

Today I successfully established a secure, multi-tier network architecture for the FinTech application using Kubernetes Services.

## 1. Securing the Data Tier (Backend)
I authored `backend-service.yaml` and deployed a `ClusterIP` Service named `fintech-backend`. This acts as an internal load balancer, abstracting the ephemeral backend Pod IPs and providing a permanent DNS name. By strictly using ClusterIP, I ensured the Node.js API remains completely inaccessible from the public internet, satisfying core security requirements.

## 2. Exposing the Presentation Tier (Frontend)
I authored `frontend-service.yaml` and deployed a `NodePort` Service named `fintech-frontend`. This explicitly exposes the Nginx web servers to external ingress. 

## The Result
I applied both manifests using `kubectl apply -f` and verified the routing table with `kubectl get svc`. Using `minikube service fintech-frontend`, I successfully accessed the application via my local browser. The frontend is now public-facing, while the backend remains securely isolated within the cluster's internal network.
