# Week 48: Authoring Ingress Routing Rules

Today I executed the final configuration of my Kubernetes networking architecture by deploying an `Ingress` resource to route Layer 7 traffic.

## The Routing Configuration
With the NGINX Ingress Controller running as the cluster's edge router, I authored `frontend-ingress.yaml`. This declarative manifest serves as the routing rulebook. 

**Key Configuration Parameters:**
* `ingressClassName: nginx`: Explicitly binds this rulebook to the NGINX controller, which is critical in enterprise environments that may run multiple types of load balancers simultaneously.
* `pathType: Prefix`: Defines the URL matching strategy. Setting the path to `/` ensures that all base traffic is captured.
* `backend`: Directs the matched traffic to the internal `frontend-service` ClusterIP on port 80.

## Verification
I applied the manifest utilizing `kubectl apply -f frontend-ingress.yaml`. Running `kubectl get ingress` confirmed the resource was successfully registered. Furthermore, inspecting the controller Pod logs (`kubectl logs -n ingress-nginx...`) verified that the controller detected the new object and dynamically updated its internal NGINX configuration without requiring a restart. This proves the architecture can seamlessly route external web traffic to internal microservices dynamically.
