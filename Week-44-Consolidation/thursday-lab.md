# Week 44: Global Visibility and Cascading Deletion

Today I practiced administrative cluster commands, focusing on global resource visibility and namespace-level teardowns.

## 1. Global Resource Visibility
To audit the entire physical cluster, I utilized the `--all-namespaces` (or `-A`) flag:
`kubectl get pods -A`
This command overrides the default scope, returning a comprehensive list of all Pods across all namespaces. This view is critical for cluster administrators as it reveals the underlying `kube-system` workloads (such as DNS and API servers) alongside user workloads.

## 2. Cascading Deletion
To clean up the temporary environment created yesterday, I executed a namespace deletion:
`kubectl delete namespace test`
This demonstrated the concept of cascading deletion. By destroying the logical boundary, the Control Plane automatically terminates all resources (like the isolated Nginx Pod) contained within it. This makes namespaces an excellent tool for managing ephemeral development environments, as teardown is a single command.
