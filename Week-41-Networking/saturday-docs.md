# Week 41: Documenting Multi-Tier Network Architecture

Today I secured my infrastructure code and established clear architectural documentation for the FinTech project.

## Version Control
I committed and pushed `backend-service.yaml` and `frontend-service.yaml` to the main application repository, ensuring the complete desired state of the network is strictly versioned.

## Architectural Diagramming
I updated the project's `README.md` to include a comprehensive "Networking" section. I authored an ASCII traffic flow diagram that visually explains the request lifecycle:
1. External user traffic hits the `NodePort` Service.
2. The Service routes the traffic to the Nginx Presentation Tier Pods.
3. The Nginx Pods communicate with the `ClusterIP` Service via internal DNS.
4. The ClusterIP load-balances the internal request to the Node.js Logic Tier Pods.

Documenting this flow is critical for maintaining infrastructure visibility and ensuring seamless handoffs to other engineering team members.
