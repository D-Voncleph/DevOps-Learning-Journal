# Week 48: Installing an Ingress Controller

Today I executed the installation of a Layer 7 Ingress Controller to manage external cluster traffic.

## The Platform-Agnostic Pivot
The official curriculum dictates the installation of the AWS Load Balancer Controller. However, because I am executing these deployments in a zero-cost, cloud-agnostic Killercoda sandbox rather than a paid AWS environment, the AWS-specific controller would fail to authenticate. 

To achieve the exact same architectural goal, I pivoted to the **NGINX Ingress Controller**. 

## Execution and Verification
The NGINX Ingress Controller acts as a software-based Application Load Balancer. It watches the cluster API for `Ingress` objects and dynamically updates its internal NGINX configuration to route HTTP/HTTPS traffic to the correct internal `ClusterIP` services.

I installed the controller utilizing the official Kubernetes manifest for bare-metal/agnostic deployments:
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.2/deploy/static/provider/baremetal/deploy.yaml`

Running `kubectl get pods -n ingress-nginx` confirmed the controller successfully deployed and is actively listening for incoming routing rules. This ensures my architecture remains highly portable and avoids cloud-provider lock-in.
