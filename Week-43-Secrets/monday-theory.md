# Week 43: Configuration Security with Secrets

Today I advanced my configuration management strategy by studying Kubernetes Secrets, the secure counterpart to ConfigMaps.

## The Purpose of Secrets
While ConfigMaps are designed for non-sensitive data, the `Secret` object is specifically engineered to handle sensitive credentials such as database passwords, API keys, OAuth tokens, and TLS certificates. 

Like ConfigMaps, Secrets allow for true container immutability. They can be injected into a Pod at runtime either as OS-level environment variables or mounted as physical files within a volume.

## The Security Caveat (Base64 vs. Encryption)
A critical security distinction is that, by default, native Kubernetes Secrets are obfuscated via **Base64 encoding**, not true encryption. 
* **The Benefit:** Base64 encoding prevents sensitive data from appearing in plain text during casual terminal output or accidental log scraping.
* **The Risk:** Base64 is easily decoded. Therefore, native Secrets rely heavily on strict Kubernetes Role-Based Access Control (RBAC) to ensure unauthorized users cannot query the Secret objects via the API Server. For true production security, encryption at rest must be explicitly configured within the `etcd` datastore.
