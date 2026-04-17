# Week 44 Project: Full Stack Infrastructure Orchestration

Today I successfully executed a full-stack deployment of the multi-tier FinTech application using purely declarative Infrastructure as Code.

## The Deployment Sequence
To ensure rapid and stable provisioning, I applied the manifests in an order that respects architectural dependencies:

1. **Data Initialization:** Applied `backend-secret.yaml` and `frontend-configmap.yaml` to populate etcd with the necessary environment variables and credentials.
2. **Backend Provisioning:** Applied `backend-deployment.yaml` and `backend-service.yaml`. The Pods successfully ingested the Base64 decoded secrets and were abstracted behind a secure `ClusterIP`.
3. **Frontend Provisioning:** Applied `frontend-deployment.yaml` and `frontend-service.yaml`. The Nginx Pods successfully ingested the backend DNS configuration and were exposed externally via a `NodePort`.

## Validation
Executing `kubectl get all` confirmed that all custom resources (Pods, ReplicaSets, Services) were healthy and correctly networked. Finally, using the `minikube service` tunnel, I successfully resolved the application in my local browser, proving external ingress routing.
