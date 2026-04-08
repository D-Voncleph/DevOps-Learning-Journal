# Week 43: Imperative Secret Creation and Base64 Auditing

Today I practically demonstrated the creation and underlying vulnerability of native Kubernetes Secrets.

## The Lab Execution
1. **Creation:** I utilized the imperative CLI command to generate an Opaque secret: 
   `kubectl create secret generic db-credentials --from-literal=username=admin --from-literal=password=SuperSecretPassword123!`
2. **Inspection:** I extracted the raw state of the object from etcd using `kubectl get secret db-credentials -o yaml`. 
3. **Observation:** The output confirmed that the literal values were not stored in plain text, but were instead converted into Base64 encoded strings within the `data` dictionary.
4. **Vulnerability Demonstration:** To prove that Base64 encoding provides zero cryptographic security, I piped the encoded password string through the standard Linux decoder (`echo "<string>" | base64 --decode`). The original plain-text password was instantly revealed.

This exercise solidifies the principle that while Secrets are excellent for separating sensitive data from code and applying RBAC, they must be treated as plain-text equivalents unless etcd encryption or an external KMS is explicitly configured.
