# Week 44: Kubernetes Core Objects Review

Today I reviewed the four foundational Kubernetes objects required to run a production-grade application. Understanding how these objects interlock is critical for architecting resilient systems.

## The Architecture Stack
1. **Compute (Deployments):** The orchestrator of Pods. It guarantees High Availability through ReplicaSets and enables seamless rolling updates. It ensures the application is always running.
2. **Networking (Services):** The stable entry point. It solves the "ephemeral IP" problem by providing a permanent DNS record and load balancing traffic to the active Pods managed by the Deployment.
3. **Configuration (ConfigMaps):** The decoupling mechanism. It enforces container immutability by storing non-sensitive environment variables and files separately from the Docker image, injecting them only at runtime.
4. **Security (Secrets):** The credential store. While only Base64 encoded by default, it structurally separates sensitive data (like database passwords) from standard configuration, allowing for strict access control and in-memory (`tmpfs`) volume mounting.

**The Workflow:** A **Service** routes traffic to a **Deployment**, which spins up Pods that ingest a **ConfigMap** for their environment settings and a **Secret** for their database authentication.
