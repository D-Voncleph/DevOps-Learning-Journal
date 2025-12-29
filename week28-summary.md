# Week 28 Summary: The Life of a Packet in Terraform

This week, I moved from using the default AWS network to provisioning a custom **Virtual Private Cloud (VPC)** from scratch using Terraform.

To prove my understanding, here is the trace of a web request entering my new infrastructure:

## 🌐 The Journey of a Request

1.  **The Entry (Internet Gateway):**
    The request hits the **Internet Gateway (IGW)** (`aws_internet_gateway`), which I attached to the VPC. This is the only physical entry point into my custom cloud network.

2.  **The Map (Route Table):**
    Once inside the VPC, the network checks the **Route Table** (`aws_route_table`) associated with the destination subnet. It looks for a rule that matches the return traffic path (`0.0.0.0/0 -> igw-id`), confirming that this traffic is allowed to flow back out.

3.  **The Room (Public Subnet):**
    The request is routed to the **Public Subnet** (`aws_subnet`), which I explicitly defined with the CIDR `10.0.1.0/24`. It is "public" specifically because I associated it with the route table mentioned above.

4.  **The Guard (Security Group):**
    Before touching the server, the packet hits the **Security Group** firewall (`aws_security_group`). It checks the Ingress Rule: *"Is this traffic on Port 80 (HTTP)?"* If yes, the door opens.

5.  **The Destination (EC2 Instance):**
    Finally, the request reaches the **EC2 Instance** (`aws_instance`). Because I updated the Terraform code to set `subnet_id = aws_subnet.public.id`, this server is physically located inside the public subnet, allowing it to receive the traffic and respond to the user.
