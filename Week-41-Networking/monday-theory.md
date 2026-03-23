# Week 41: Kubernetes Services & Internal Networking

Today I began Month 11 by addressing the networking limitations of raw Deployments.

## The Ephemeral IP Problem
While Deployments and ReplicaSets guarantee high availability for compute resources, they create a networking challenge. Pods are ephemeral; when they are destroyed and recreated by the controller, they are assigned brand-new IP addresses. This makes it impossible for application tiers (like a frontend talking to a backend) to rely on direct Pod-to-Pod communication.

## The Service Abstraction
To establish reliable communication, Kubernetes utilizes the `Service` object.
* **Stable Discovery:** A Service provides a single, permanent IP address and internal DNS name for a logical grouping of Pods. 
* **Dynamic Routing:** It acts as an internal load balancer. Using label selectors (e.g., `matchLabels: component: backend`), the Service dynamically tracks the shifting IP addresses of the underlying Pods. 
* **The Result:** The frontend tier can simply send requests to the static DNS name of the backend Service, and the orchestrator handles routing the traffic to a healthy, available backend Pod, regardless of how often the Pods themselves cycle.
