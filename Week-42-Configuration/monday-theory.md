# Week 42: Configuration Management & ConfigMaps

Today I began studying how to manage environment-specific configurations without compromising the immutability of container images.

## The Immutability Principle
A core tenet of DevOps is that a compiled container image must be environmentally agnostic. Hardcoding configuration data (like database connection strings or API endpoints) directly into an image is an anti-pattern. It forces engineers to build separate images for development, staging, and production environments, which introduces massive drift and invalidates testing.

## The ConfigMap Abstraction
Kubernetes solves this through the `ConfigMap` object. 
* **What it is:** A centralized cluster resource used to store non-sensitive configuration data as key-value pairs.
* **How it works:** It cleanly decouples configuration artifacts from the image content. The container is programmed to expect environment variables, and the orchestrator injects those variables from the ConfigMap into the Pod exactly at runtime. 
* **The Result:** I can promote the exact same Docker artifact across multiple environments simply by swapping the underlying ConfigMap it references.
