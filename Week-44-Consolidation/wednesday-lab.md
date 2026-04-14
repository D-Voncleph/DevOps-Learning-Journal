# Week 44: Cluster Organization with Namespaces

Today I practically demonstrated cluster multi-tenancy by utilizing Kubernetes Namespaces.

## The Concept
Namespaces act as virtual clusters backed by the same physical hardware. They provide logical isolation for K8s resources, allowing teams to separate environments (e.g., `dev`, `staging`, `prod`) or isolate multiple client workloads on a single cluster without naming collisions.

## Lab Execution
1. **Creation:** I provisioned a new namespace imperatively using `kubectl create namespace test`.
2. **Deployment:** I deployed a standalone pod, explicitly targeting the new boundary: `kubectl run test-nginx --image=nginx -n test`.
3. **Verification:** I demonstrated isolation by observing that a standard `kubectl get pods` query returned empty. The pod was only visible when strictly defining the scope via `kubectl get pods -n test`.

This proves that resources in different namespaces are structurally hidden from one another, which is a foundational requirement for secure, organized cluster management at an agency level.
