# Week 49 Project: Custom Grafana Dashboards and PromQL

Today I executed the final project for my observability sprint: engineering a custom Grafana dashboard specifically targeted at my FinTech application architecture.

## Writing PromQL
While pre-built dashboards monitor infrastructure, application-specific monitoring requires custom queries using the Prometheus Query Language (PromQL). 

To isolate the metrics for my specific workload, I authored the following query:
`container_memory_working_set_bytes{namespace="fintech-app", pod=~"backend-api.*"}`

## The Value of Targeted Dashboards
By filtering for the `fintech-app` namespace and utilizing regex to match the `backend-api` pods, I filtered out the noise of the `kube-system` and other background processes. 

This custom visualization provides exact visibility into the memory consumption of the application tier. If a memory leak occurs in the backend code, this specific dashboard will immediately reflect the upward trend, allowing for proactive restarts or code rollbacks before the Pod crashes with an Out Of Memory (OOM) error.
