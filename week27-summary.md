# Week 27 Summary: Variables, Outputs, and Reusability

This week, I focused on refactoring my Terraform code to move from static scripts to reusable Infrastructure as Code modules. The core lesson was understanding why **hardcoding** values is a "bad practice" and how to solve it using **Input Variables** and **Data Sources**.

## ⛔ The Problem with Hardcoding
Hardcoding refers to typing static values (like `"ami-0a3c3..."` or `"eu-north-1"`) directly into the resource blocks of `main.tf`.

### 1. Brittleness (Region Locking)
* **Issue:** An AMI ID valid in Stockholm (`eu-north-1`) does not exist in N. Virginia (`us-east-1`). If I hardcode the ID, my code breaks immediately if I try to deploy it to a different region.
* **Fix:** Use **Data Sources** (`data "aws_ami"`) to ask AWS for the correct ID for the current region dynamically.

### 2. Security Risks ("AMI Rot")
* **Issue:** OS images are updated constantly with security patches. If I hardcode an ID, I am locking my infrastructure to an old, potentially vulnerable version of Linux.
* **Fix:** Use dynamic lookups with `most_recent = true` to always fetch the latest secure image.

### 3. Lack of Reusability
* **Issue:** If I hardcode `instance_type = "t3.large"`, I cannot use the same code for a cheap Dev environment (`t3.micro`) without manually editing the file every time.
* **Fix:** Use **Input Variables** (`var.instance_type`). This allows me to inject different configurations (Dev vs. Prod) into the same codebase at runtime.

## 🛠️ The Solution: The Input/Output Model

I restructured my project into a standard module format:

* **`variables.tf` (Inputs):** Defines parameters like Region, Instance Type, and Project Name. This makes the code flexible.
* **`main.tf` (Logic):** The core infrastructure code, now using `var.name` instead of raw strings.
* **`outputs.tf` (Outputs):** Returns useful data to the CLI, such as the `public_ip` of the created server, eliminating the need to search the AWS Console.

## 🔑 Key Takeaway
**"Write code once, deploy anywhere."** By parameterizing my infrastructure, I have turned a single-use script into a flexible template that can be used across multiple environments and regions without modification.
