# Week 50 Project: Comprehensive FinTech Dashboard

Today I engineered a multi-panel Grafana dashboard designed specifically to monitor the Upscale DV FinTech application architecture.

## Dashboard Architecture
I constructed a "Single Pane of Glass" utilizing PromQL to track three critical SLIs (Service Level Indicators):
1. **Ingress Traffic Velocity:** Tracked the rate of incoming requests via the NGINX ingress controller to monitor user load.
2. **Application Memory Footprint:** Utilized a Gauge visualization to track the exact memory working set of the FinTech namespace, allowing for proactive OOM (Out of Memory) prevention.
3. **Node CPU Health:** Aggregated the CPU utilization across the worker nodes to ensure the underlying infrastructure is not bottlenecking the application tier.
