# Week 40: Nginx Rolling Update Practice

Today I reinforced my understanding of deployment strategies by practicing a rolling update on my Nginx cluster.

## The Lab Execution
1.  **Modification:** I updated `nginx-deployment.yaml`, specifically changing the container image from `nginx:latest` to `nginx:1.24.0`.
2.  **Application:** I applied the new declarative state using `kubectl apply -f nginx-deployment.yaml`.
3.  **Observation:** I utilized `kubectl rollout status deployment/nginx-deployment` to monitor the live transition. This command provided a real-time stream of the controller creating Pods in the new ReplicaSet and gracefully terminating Pods in the old ReplicaSet.
4.  **Verification:** I ran `kubectl describe deployment nginx-deployment` to audit the event logs, confirming the zero-downtime scaling process was executed flawlessly. 

Practicing this workflow builds the muscle memory required to confidently manage production releases.
