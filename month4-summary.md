## Monthly Summary: Going from Zero to Cloud Deployment
This month, I completed the Introduction to Cloud & Networking phase, marking a massive leap in my technical skills. I went from having no cloud experience to successfully provisioning and running a live, secure web server on AWS.

### The Foundation of Security (IAM)
My journey began by establishing security best practices. I learned about AWS IAM (Identity and Access Management) and the critical importance of the Principle of Least Privilege. This led me to permanently lock away my root user credentials and create an IAM user (voncleph-devops) for all daily tasks, a fundamental step in securing any cloud environment. I also grasped the difference between IAM Users (for identities) and IAM Roles (for temporary permissions given to services).

### Building the Network Backbone (VPC)
The most complex and critical learning involved creating a custom network. I learned that a VPC (Virtual Private Cloud) is my own isolated network in AWS. I moved past the setup wizard to manually configure my network, including:

* **Custom CIDR Blocks:** Defining my own IP address range (10.10.0.0/16).

* **Subnets:** Understanding the difference between public subnets (where my web server lives) and private subnets (where I will eventually place databases).

* **Routing:** Manually creating the Internet Gateway and configuring the Route Table to allow public traffic via the 0.0.0.0/0 destination—the key to unlocking internet access.

### Launching and Securing the Web Server (EC2 & SGs)
This phase brought all the components together for my FinTech application:

* **Compute:** I launched an EC2 instance, specifying the Ubuntu AMI and a Free Tier-eligible t3.micro size.

* **Secure Access:** I mastered the use of SSH key pairs and the non-intuitive steps required to successfully connect to the instance via my local terminal.

* **Security Groups:** I configured a stateful virtual firewall (FinTech-Web-SG) that enforced security: restricting SSH access (Port 22) to only my specific IP address, while allowing HTTP traffic (Port 80) to the entire internet.

* **Deployment:** I installed the Nginx web server on the EC2 instance and successfully verified the default welcome page in my browser.


**This month was about integration. I learned how to move large assets to S3 (object storage) and how to ensure my Python code and Git skills are supported by a powerful, secure, and custom-designed cloud infrastructure.**