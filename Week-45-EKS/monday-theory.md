# Week 45: Introduction to Amazon EKS

Today I began Month 12 by studying managed Kubernetes services, specifically Amazon Elastic Kubernetes Service (EKS).

## The Operational Burden of the Control Plane
In a self-hosted Kubernetes architecture, the engineering team is responsible for the High Availability (HA) and disaster recovery of the Control Plane (API Server, `etcd`, Scheduler). Managing `etcd` state and scaling the API server under heavy load requires significant operational overhead and specialized expertise.

## The Managed Service Paradigm (EKS)
Amazon EKS shifts this operational burden to the cloud provider through a shared responsibility model:
* **AWS Responsibility (Control Plane):** AWS fully manages, scales, and secures the Kubernetes Control Plane across multiple Availability Zones. The `etcd` database and API server are highly available by default, automatically patched, and continuously backed up.
* **Customer Responsibility (Data Plane):** The engineer is only responsible for provisioning and maintaining the Worker Nodes (EC2 instances or Fargate profiles) and deploying the actual application workloads (Pods, Services, ConfigMaps).

By utilizing EKS, teams can focus entirely on application architecture and deployment lifecycles rather than cluster administrative maintenance.

