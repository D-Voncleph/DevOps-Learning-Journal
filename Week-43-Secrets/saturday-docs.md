# Week 43: Documenting Security Exceptions

Today I pushed my configuration to version control and documented a critical security exception regarding Kubernetes Secrets.

## The Security Disclaimer
Because Kubernetes native Secrets rely on easily decoded Base64 translation rather than true encryption, committing a `secret.yaml` file to a Git repository exposes those credentials to anyone with read access to the codebase. 

To maintain a complete educational record of my architecture, I pushed `backend-secret.yaml` to my repository. However, I mitigated the professional risk by adding a prominent `⚠️ SECURITY WARNING` to the project's `README.md`. 

This documentation explicitly states that:
1. The commit is for learning purposes only.
2. It violates production best practices.
3. True production architectures require `.gitignore` exclusion, SOPS encryption, or external Key Management Systems (KMS) like HashiCorp Vault. 

Acknowledging and documenting security debt is a fundamental responsibility of a DevOps engineer.
