# Week 41: Kubernetes Service Types

Today I studied the three primary Kubernetes Service types used to control network ingress and internal routing.

## 1. ClusterIP (Default)
* **Scope:** Internal cluster communication only.
* **Function:** Provisions a stable internal IP and DNS name. External traffic cannot reach it.
* **Use Case:** Backend APIs, databases, and microservices that should remain completely isolated from the public internet.

## 2. NodePort
* **Scope:** External and Internal.
* **Function:** Opens a specific, static port (in the 30000-32767 range) on the IP address of every Worker Node in the cluster. Traffic hitting that port is routed to the Service.
* **Use Case:** Local development (e.g., Minikube), quick debugging, or as a building block for higher-level routing. Not ideal for direct production exposure.

## 3. LoadBalancer
* **Scope:** Public Internet.
* **Function:** Integrates directly with a cloud provider's API (AWS ELB, GCP Cloud Load Balancing) to provision an external load balancer with a public IP address. It automatically routes incoming internet traffic down to the NodePorts and into the cluster.
* **Use Case:** The standard production method for exposing frontend web servers and public APIs to end-users.
