# Week 42 Project: Declarative ConfigMaps and Env Var Injection

Today I transitioned from imperative configuration generation to declarative Infrastructure as Code, injecting environment variables into my presentation tier.

## The Infrastructure Updates
1. **The ConfigMap:** I authored `frontend-configmap.yaml`, defining a key-value pair (`BACKEND_HOST: "fintech-backend"`) that stores the internal DNS name of the data tier Service.
2. **The Deployment:** I updated `frontend-deployment.yaml` to include an `env` block. Using `valueFrom.configMapKeyRef`, I instructed the orchestrator to pull the specific key from the ConfigMap and inject it as an OS-level environment variable during the container startup phase.

## Verification
I executed `kubectl apply -f` for both manifests. To verify the injection, I established an interactive shell inside the newly provisioned Nginx Pod (`kubectl exec`) and ran the `printenv` command. The variable successfully resolved, proving that I can dynamically pass dynamic routing configuration to my frontend without hardcoding service names into the Docker image.
