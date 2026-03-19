# Week 40: Imperative Scaling for Traffic Spikes

Today I practiced scaling my infrastructure horizontally to handle sudden changes in traffic.

## The Lab Execution
1. **Observation:** Verified the baseline state of my `nginx-deployment` (3 replicas).
2. **Scale Up (Capacity Expansion):** Executed the imperative command `kubectl scale deployment nginx-deployment --replicas=5`. The ReplicaSet instantly recognized the new desired state and provisioned 2 additional Pods.
3. **Scale Down (Resource Optimization):** Executed `kubectl scale deployment nginx-deployment --replicas=1`. The ReplicaSet gracefully terminated the unneeded instances to conserve cluster resources.

## Declarative vs. Imperative Note
While `kubectl scale` is incredibly powerful for immediate, emergency responses to traffic spikes, it modifies the cluster's live state *without* updating the underlying `nginx-deployment.yaml` file. For permanent architectural changes, updating the declarative YAML and running `kubectl apply -f` remains the best practice for Infrastructure as Code.
