# Week 42: Mounting ConfigMaps as Volumes

Today I successfully injected external configuration data directly into a running container's file system using Kubernetes Volume Mounts.

## The Configuration Update
I updated `frontend-deployment.yaml` to dynamically mount the `frontend-file-config` ConfigMap into the Nginx pods.
* **The Volume Definition:** At the Pod spec level, I declared a volume (`nginx-config-volume`) explicitly backed by the target ConfigMap.
* **The Volume Mount:** Inside the container spec, I mapped that volume to `/etc/nginx/conf.d`, which is the standard directory Nginx utilizes for auxiliary `.conf` files.

## Execution and Verification
After applying the updated manifest, the ReplicaSet provisioned new Pods. To verify the mount, I utilized `kubectl exec -it <pod-name> -- sh` to establish an interactive shell within the container. Executing `cat /etc/nginx/conf.d/custom-nginx.conf` revealed the exact configuration text stored in the ConfigMap. 

This confirms that I can decouple configuration files from my Docker images and rely on the orchestrator to dynamically inject them at runtime.	
