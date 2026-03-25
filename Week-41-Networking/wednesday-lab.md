# Week 41: Establishing Internal DNS with ClusterIP

Today I successfully established reliable internal networking by deploying my first Kubernetes Service.

## The Configuration
I authored `nginx-service.yaml` to create a `ClusterIP` Service. 
* I set `metadata.name: nginx-service`, establishing the permanent internal DNS record.
* I utilized `selector: app: nginx` to dynamically bind the Service to my existing Nginx Deployment fleet.
* I mapped port 80 on the Service to targetPort 80 on the underlying containers.

## The Validation Test
To prove that internal DNS resolution and traffic routing were functioning, I executed the following test:
1. Provisioned an ephemeral debugging environment using `kubectl run -it --rm debug --image=curlimages/curl -- sh`.
2. From within that isolated Pod, I executed `curl http://nginx-service`.
3. The orchestrator successfully intercepted the DNS name, resolved it to the Service's stable IP, and load-balanced the request to an active Nginx container, returning the HTTP response.

I have officially abstracted away the ephemeral nature of Pod IPs.
