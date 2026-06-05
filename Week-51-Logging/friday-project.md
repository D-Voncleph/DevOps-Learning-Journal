# Week 51 Project: Log Visualization with Kibana

Today I executed the final validation of the EFK stack by exposing Kibana, creating an index pattern, and actively filtering structured application logs.

## The Kibana Configuration
To visualize the data ingested by Elasticsearch, Kibana requires a "Data View" (Index Pattern). Because Fluentd formats its payloads to be Logstash-compatible by default, I created an index pattern matching `logstash-*` and mapped the time-series data to the `@timestamp` field.

## Log Discovery and Filtering
Upon navigating to the Discover panel, I was presented with the raw JSON stream of all cluster activity. To simulate a live incident response for an Upscale DV client, I utilized the Kibana Query Language (KQL) to isolate the application tier. 

By applying the filter `kubernetes.namespace_name : "fintech-app"`, I successfully stripped away the `kube-system` noise. This proves the architecture's value: if a FinTech microservice begins throwing 500-level errors, I can instantly isolate that specific namespace, filter by `level: "ERROR"`, and identify the exact line of failing code in milliseconds.
