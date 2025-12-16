# Week 26 Summary: Resources vs. Data Sources

This week, I moved beyond basic provisioning to understanding how to interact with existing cloud infrastructure. The core lesson was the distinction between creating resources and querying data.

## 1. The Resource Block (`resource`)
* **Purpose:** The "Builder." It tells Terraform to **create, manage, and delete** infrastructure.
* **Behavior:** It enforces a desired state. If the resource doesn't exist, Terraform creates it. If it differs from the code, Terraform updates it.
* **Example:** "I want a new EC2 instance named `web-server`."
    ```hcl
    resource "aws_instance" "web" { ... }
    ```

## 2. The Data Source Block (`data`)
* **Purpose:** The "Search Engine." It tells Terraform to **fetch information** about something that *already exists* (read-only).
* **Behavior:** It never modifies infrastructure. It simply queries the cloud provider API to find IDs, IPs, or ARNs to use elsewhere in the configuration.
* **Example:** "Find the ID of the latest Ubuntu AMI so I can build my server with it."
    ```hcl
    data "aws_ami" "ubuntu" { ... }
    ```

## 🔑 Key Takeaway
Resources define **what I want to own**. Data Sources define **what I need to know** about the environment. Connecting them (e.g., using a Data Source to find a VPC ID for a new Security Group Resource) is the key to writing dynamic, flexible code.
