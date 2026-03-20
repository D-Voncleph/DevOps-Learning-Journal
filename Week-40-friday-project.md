# Week 40 Project: Multi-Tier Application Deployment

Today I expanded my cluster architecture by deploying a multi-tier environment, successfully separating my application's frontend and backend concerns.

## The Infrastructure Expansion
I authored `frontend-deployment.yaml` to orchestrate an Nginx web server, acting as the client-facing tier of the FinTech application. 
* **Labeling Strategy:** I strictly utilized `app: fintech` and `component: frontend` in the metadata to logically isolate this deployment from the `component: backend` deployment. This decoupling is critical for independent horizontal scaling and precise network routing.

## Execution
I executed `kubectl apply -f` on both the backend and frontend manifests. Using `kubectl get deployments` and `kubectl get pods`, I verified that the cluster is now simultaneously managing two distinct ReplicaSets, effectively running the entire decoupled application stack within the same environment.
