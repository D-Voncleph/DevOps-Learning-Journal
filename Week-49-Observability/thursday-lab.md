# Week 49: Accessing and Exploring Grafana

Today I exposed the Grafana UI and explored the pre-configured dashboards provided by the `kube-prometheus-stack`.

## Accessing the UI
Because I am testing in a bare-metal sandbox, I patched the `observability-grafana` Service to utilize a `NodePort`, allowing me to securely route browser traffic into the cluster.

## The Wealth of Pre-Built Metrics
The Helm chart does not just install empty software; it installs dozens of pre-configured, enterprise-grade dashboards. By navigating to the Kubernetes Compute Resources dashboard, I was immediately presented with live time-series data detailing CPU utilization, memory quotas, and network bandwidth across the entire cluster. This out-of-the-box visibility is critical for establishing a baseline of cluster health before deploying heavy application workloads.
