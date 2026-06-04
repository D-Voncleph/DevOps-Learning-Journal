# Week 51: Log Collection via DaemonSets (Fluentd)

Today I completed the EFK logging pipeline by deploying Fluentd as the log aggregator and shipper.

## The DaemonSet Architecture
To guarantee 100% log capture across a distributed architecture, the collector must be present on every physical machine. Relying on standard `Deployments` risks leaving nodes without a collector due to dynamic pod scheduling. 

By deploying Fluentd as a `DaemonSet`, the Kubernetes Control Plane guarantees that exactly one Fluentd instance runs on every active Worker Node. As the underlying Auto Scaling Group scales the cluster out or in, the DaemonSet dynamically adjusts, ensuring no blind spots in the observability pipeline.

## Pipeline Completion
With Fluentd active, it mounts the host node's `/var/log/containers/` directory, tails the raw Docker/containerd logs, structures them, and streams them directly into the local Elasticsearch instance. The EFK stack is now fully operational, providing a central, persistent, and highly searchable logging database for the entire microservice architecture.
