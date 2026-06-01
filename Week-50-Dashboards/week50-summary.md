# Week 50 Summary: Proactive Incident Detection

This week I transitioned from gathering metrics to visualizing them through PromQL and Grafana.

## ❓ How would you use this dashboard to detect a problem?

A comprehensive dashboard shifts a DevOps team from reactive (waiting for customer complaints) to proactive (spotting the math before the crash). 

**Scenario 1: The Memory Leak**
If the Backend Memory panel shows a slow, continuous upward slope over 24 hours without leveling off, I know the application code has a memory leak. I can gracefully restart the pods or rollback the deployment before the server runs out of RAM and crashes completely.

**Scenario 2: The Traffic Spike (DDoS or Viral Event)**
If the Frontend Traffic (RPS) panel suddenly spikes by 500%, but the CPU Health panel flatlines at 100%, I know the infrastructure is bottlenecked. I can immediately intervene by scaling the Kubernetes deployment (`kubectl scale`) or adjusting the Terraform Auto Scaling Group to handle the load. The dashboard gives me the exact context needed to triage the incident in seconds.

