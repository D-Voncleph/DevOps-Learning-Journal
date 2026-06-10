# Week 51 Summary: The Necessity of Centralized Logging

This week, I successfully built and deployed the complete EFK stack.

## ❓ Why is centralized logging critical in Kubernetes?

In a legacy VM environment, if a server crashes, you can SSH into it and read the log files. In Kubernetes, that paradigm is destroyed by **ephemerality**.

If a FinTech pod runs out of memory and crashes, the Kubernetes Control Plane immediately deletes that pod and spins up a new one. When the pod is deleted, its local log files are instantly vaporized. The evidence of *why* it crashed is gone forever. 

Centralized logging (via Fluentd) solves this by streaming those logs off the physical node in real-time. Even if the pod is destroyed a millisecond later, the error log is already safely indexed in Elasticsearch. Furthermore, in a microservice architecture, a single user checkout might hit 5 different pods. Centralized logging allows us to search a single database to trace that user's entire journey across the cluster.
