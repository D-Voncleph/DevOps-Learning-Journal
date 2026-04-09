# Week 43: Injecting Secrets as Environment Variables

Today I successfully mapped a Kubernetes Secret into a running container without exposing the credentials in the declarative code.

## Base64 Utility Practice
I practiced manual string translation using the Linux CLI:
* **Encoding:** `echo -n "string" | base64` (Noting the importance of `-n` to omit newline characters).
* **Decoding:** `echo "encoded_string" | base64 --decode`

## Secret Injection (Environment Variables)
I authored `secret-pod.yaml` to deploy an Alpine Linux container for testing. To securely pass the `db-credentials` to the container:
1. I utilized the `env` block within the container spec.
2. I utilized `valueFrom.secretKeyRef` to specifically target the `username` and `password` keys from the Secret stored in the cluster.

## Verification
After applying the manifest (`kubectl apply -f`), I established an interactive shell inside the Pod (`kubectl exec -it secret-test-pod -- sh`). Running `echo $DATABASE_USER` and `echo $DATABASE_PASS` successfully returned the plain-text credentials. 

This confirms the Kubelet securely pulls the obfuscated data from etcd, decodes it, and passes it securely to the application process at runtime, maintaining complete separation of code and sensitive configuration.
