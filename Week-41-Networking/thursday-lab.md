# Week 41: Exposing Applications via NodePort

Today I achieved external network ingress by transitioning my Service from an internal `ClusterIP` to a public-facing `NodePort`.

## The Configuration Update
I modified `nginx-service.yaml`, changing the `spec.type` to `NodePort`. 
Upon executing `kubectl apply -f`, the Control Plane automatically allocated a high-range port (30000-32767) on the Minikube Worker Node and mapped it to the internal Service port (80).

## Verification and Access
To bypass the complexities of WSL/Docker network bridging, I utilized the `minikube service nginx-service` command. This established a direct tunnel to the NodePort, outputting a resolvable localhost URL. 
Visiting this URL in my host machine's web browser successfully rendered the Nginx welcome page, proving that external internet traffic is now successfully routing through the NodePort, hitting the Service load balancer, and resolving to an active Pod.
