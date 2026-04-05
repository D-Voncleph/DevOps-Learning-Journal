# Week 42: The ConfigMap Reference Guide

This week, I mastered decoupling configuration from application code. Here is the standard operating procedure for creating and consuming Kubernetes ConfigMaps.

## 1. Creation Strategies

ConfigMaps can be created imperatively (for speed) or declaratively (for version control).

- **Imperative (From Literal):** Great for quick environment variables.
```bash
  kubectl create configmap my-config --from-literal=KEY=value
```

- **Imperative (From File):** Great for importing entire config files (like `nginx.conf`).
```bash
  kubectl create configmap my-config --from-file=path/to/file.conf
```

- **Declarative (YAML):** The standard for production.
```yaml
  apiVersion: v1
  kind: ConfigMap
  metadata:
    name: my-config
  data:
    MY_ENV_VAR: "some-value"
```

## 2. Consumption Strategies

Once a ConfigMap exists in the cluster, it must be injected into a Pod.

### Method A: Environment Variables

- **Use Case:** Best for modern APIs (like Node.js) that read `process.env`.
- **Implementation:** Use the `env` block in the Deployment spec, targeting `valueFrom.configMapKeyRef`.
- **Note:** Static. If the ConfigMap updates, the Pod must be restarted to see the new variable.

### Method B: Volume Mounts

- **Use Case:** Best for applications that require physical configuration files (like Nginx).
- **Implementation:** Define a `volume` backed by the ConfigMap, then use `volumeMounts` inside the container spec to place it in the file system (e.g., `/etc/nginx/conf.d`).
- **Note:** Dynamic. Kubernetes automatically updates the mounted file if the underlying ConfigMap changes.
