# Week 41 Summary: Solving the Ephemeral IP Problem

This week, I transitioned from orchestrating compute resources to architecting internal and external networks. I successfully deployed Kubernetes Services to build a decoupled, multi-tier network for my FinTech application.

## ❓ The Primary Problem: Ephemeral Pod IPs

While Deployments and ReplicaSets guarantee high availability by automatically replacing crashed Pods, they introduce a massive networking hurdle: **Pods are mortal, and every time a new Pod is provisioned, it receives a brand-new, unpredictable IP address.**

If my presentation tier (frontend) is configured to send API requests to a specific data tier (backend) Pod IP, the application will break the second that backend Pod is replaced. The frontend would be sending data to a dead address. Deployments manage the compute, but they do not provide reliable network discovery.

## 🛡️ The Solution: Kubernetes Services

Kubernetes Services solve this problem by abstracting the ephemeral Pods behind a stable network interface. 

1. **Permanent Identity:** A Service provisions a single, unchanging IP address and a permanent internal DNS record (e.g., `http://fintech-backend`). Even if every single backend Pod is destroyed and recreated, this Service address never changes.
2. **Dynamic Routing & Load Balancing:** Using label selectors, the Service continuously tracks the shifting IP addresses of the underlying Pods. It acts as an internal load balancer, automatically distributing incoming traffic only to active, healthy Pods.

## 🏗️ Architectural Application
To implement this securely:
* I utilized a **ClusterIP** Service for the Node.js backend. This provided the stable internal DNS name while keeping the API strictly walled off from the public internet.
* I utilized a **NodePort** Service for the Nginx frontend. This provided the stable routing while simultaneously punching a hole through the cluster to allow external browser traffic to reach the application.
