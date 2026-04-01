# Week 42: Imperative ConfigMap Creation

Today I practiced generating Kubernetes ConfigMaps using imperative CLI commands, covering both literal values and file-based configurations.

## 1. Creation via Literals
To simulate injecting environment variables into a backend API, I used the `--from-literal` flag:
`kubectl create configmap backend-env-config --from-literal=DB_HOST=database.local`
This method is highly efficient for passing isolated, static strings (like URLs, feature flags, or port numbers) directly into the cluster's state without requiring a dedicated YAML manifest.

## 2. Creation via Files
To simulate providing a structured configuration file to a web server, I used the `--from-file` flag:
`kubectl create configmap frontend-file-config --from-file=custom-nginx.conf`
The orchestrator intelligently maps the filename as the dictionary key and the file's exact textual contents as the dictionary value. This allows me to store entire application configuration files cleanly within the Kubernetes control plane.

## Verification
I utilized `kubectl describe cm <name>` to inspect the data payloads of both ConfigMaps, verifying that the values were accurately parsed and stored in etcd.
