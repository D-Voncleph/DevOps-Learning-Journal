# Week 51: Deploying Elasticsearch and Kibana

Today I deployed the foundation of the EFK stack: Elasticsearch (the data store) and Kibana (the presentation layer).

## Managing Stateful Workloads
Unlike web applications which are stateless `Deployments`, Elasticsearch is a highly stateful NoSQL database. Deploying it requires a `StatefulSet` and Persistent Volume Claims (PVCs) to ensure that if a database pod restarts, it does not lose its indexed data.

## Resource Optimization via Helm
Elasticsearch is inherently resource-intensive due to its JVM architecture and Lucene indexing engine. To deploy this stack within an ephemeral, cost-optimized sandbox environment, I utilized Helm override flags (`--set`) to strictly throttle the default enterprise configurations:
* `replicas=1`: Scaled down from a high-availability multi-node cluster to a single master node.
* `resources.requests.memory=512Mi`: Constrained the JVM heap size to prevent Out of Memory (OOM) cascading failures on the underlying worker nodes.

Deploying stateful applications requires precise capacity planning. By successfully deploying this restricted footprint, I validated the architecture while ensuring the cluster's compute budget remained uncompromised.
