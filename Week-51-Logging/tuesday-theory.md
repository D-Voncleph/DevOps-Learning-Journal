# Week 51: The EFK Logging Stack

Today I studied the architecture of the EFK stack, the industry standard for centralized Kubernetes logging.

## The Problem with Ephemeral Logs
In Kubernetes, containers are ephemeral. When a pod is destroyed or a node scales down, the local log files (`/var/log/containers/...`) are permanently deleted. To ensure forensic evidence survives a crash, logs must be shipped to a persistent, central database in real-time.

## The EFK Pipeline
To achieve centralized logging, we utilize a three-tier architecture:

1. **Fluentd (The Shipper):** Deployed as a Kubernetes `DaemonSet` to ensure one instance runs on every worker node. It tails the raw container log files, structures the data, appends Kubernetes metadata (Pod Name, Namespace), and forwards the payload.
2. **Elasticsearch (The Database):** A distributed, RESTful search and analytics engine. It ingests the JSON payloads from Fluentd and indexes every field, allowing for sub-second, complex queries across petabytes of historical log data.
3. **Kibana (The UI):** The visualization and exploration frontend. It sits on top of Elasticsearch, allowing DevOps engineers to execute Lucene queries, filter logs by specific microservices, and build visual dashboards of error rates and log volumes.

