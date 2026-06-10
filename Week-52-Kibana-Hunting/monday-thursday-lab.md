# Week 52: Advanced Log Filtering with KQL

Over this lab block, I mastered the Kibana Query Language (KQL) to surgically extract forensic data from Elasticsearch.

## The Incident Response Scenario
If an Upscale DV client reports that users are failing to process payments, scrolling through a raw log stream is impossible. I must filter out the noise.

### Query 1: The Broad Filter
First, I strip away all Kubernetes system logs and focus only on the application namespace:
`kubernetes.namespace_name : "fintech-app"`

### Query 2: The Service Isolation
Next, I know the issue is with payments, so I isolate the backend pods, ignoring the frontend traffic:
`kubernetes.namespace_name : "fintech-app" AND kubernetes.container_name : "backend-api"`

### Query 3: The Error Hunt (The Final Query)
Finally, I filter out all the successful `INFO` logs to reveal only the application crashes:
`kubernetes.namespace_name : "fintech-app" AND kubernetes.container_name : "backend-api" AND level : "ERROR"`

By combining these structured JSON keys with boolean operators (`AND`, `OR`), Kibana reduces millions of log lines down to the exact 4 error messages causing the outage, turning a 3-hour debugging session into a 3-minute fix.
