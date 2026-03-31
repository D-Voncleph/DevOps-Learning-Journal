# Week 42: Consuming ConfigMaps (Env Vars vs. Volumes)

Today I studied the two primary mechanisms for injecting ConfigMap data into Kubernetes Pods.

## 1. Environment Variable Injection
* **Mechanism:** The orchestrator maps ConfigMap key-value pairs directly into the container's OS environment variables at startup.
* **Application:** Ideal for modern 12-factor apps (like a Node.js API) that consume configuration via `process.env`.
* **Constraint:** Static. Changes to the ConfigMap require a Pod restart to take effect.

## 2. Volume Mounting
* **Mechanism:** The orchestrator provisions a virtual volume, populates it with files (where keys are filenames and values are file contents), and mounts it directly into the container's file system.
* **Application:** Essential for applications that require structured configuration files (e.g., Nginx requiring an `nginx.conf` file).
* **Advantage:** Dynamic. K8s automatically updates the mounted files in real-time when the underlying ConfigMap is modified, though the application process may require a reload signal to read the updated file.
