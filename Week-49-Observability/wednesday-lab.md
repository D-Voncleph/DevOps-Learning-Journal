# Week 49: Deploying Observability via Helm

Today I utilized Helm, the Kubernetes package manager, to deploy the industry-standard observability stack into my cluster.

## The Power of Helm
Deploying Prometheus and Grafana from scratch requires configuring complex StatefulSets, ConfigMaps, and Role-Based Access Control (RBAC). Helm abstracts this entirely. By utilizing the `kube-prometheus-stack` Helm chart, I deployed the complete architecture in a single command. 

This stack includes:
* **Prometheus:** The time-series database scraping metrics.
* **Grafana:** The visualization frontend.
* **Alertmanager:** The routing engine for critical alerts.
* **Node Exporters:** DaemonSets that automatically pull hardware metrics (CPU, Memory) from every physical Worker Node.

Deploying this stack into a dedicated `monitoring` namespace ensures our observability tools are logically separated from our FinTech application workloads.
