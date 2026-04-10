# Week 43 Project: Securing the FinTech Data Tier

Today I integrated Kubernetes Secrets into the core architecture of the FinTech application, securing the backend's database credentials.

## 1. Declarative Secret Generation
I authored `backend-secret.yaml` to manage the database credentials. Because YAML manifests require data to be pre-encoded, I translated the plain-text credentials into Base64 (`DB_USER` and `DB_PASS`) before committing them to the `data` block. 
*(Note: In a true production environment, this YAML file would either be encrypted via a tool like SOPS before being pushed to Git, or bypassed entirely in favor of an external Secrets Manager).*

## 2. Secure Injection
I updated the `backend-deployment.yaml` manifest, adding an `env` block to the container specification. Utilizing `valueFrom.secretKeyRef`, I explicitly mapped the Base64 keys from the Secret to plain-text OS-level environment variables (`DATABASE_USER` and `DATABASE_PASS`).

## Verification
Following the application of the manifests (`kubectl apply -f`), the Deployment controller executed a rolling update. I utilized `kubectl exec` to establish a shell within the newly provisioned backend pod. Running `printenv | grep DATABASE_` confirmed that the orchestrator successfully decoded the credentials and injected them into the container's environment, successfully isolating sensitive data from the application image.
