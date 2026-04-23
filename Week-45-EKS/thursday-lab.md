# Week 45: Ephemeral Cloud Infrastructure (Killercoda)

Today I transitioned from local Minikube emulation to a live cloud Kubernetes environment using an ephemeral sandbox.

## The Architecture Pivot
To rapidly interact with a cloud-hosted cluster without the overhead of AWS account management, IAM roles, or potential billing risks associated with EKS, I utilized Killercoda.

## The Sandbox Environment
Killercoda provides instant, browser-based access to a pre-provisioned Kubernetes cluster. 
1. **Provisioning:** Bypassing the 20-minute `eksctl` CloudFormation process, Killercoda spins up a dedicated Control Plane and Worker node environment in seconds.
2. **Access:** Terminal access is provided directly through the web UI, eliminating the need for local SSH key management or kubeconfig context switching.
3. **Verification:** Running `kubectl get nodes` confirmed a healthy, multi-node cluster ready for deployments.

While this environment is strictly ephemeral (destroying itself after 60 minutes), it provides the exact same API access as an enterprise EKS cluster, making it the perfect zero-risk sandbox for testing declarative manifests before production deployment.
