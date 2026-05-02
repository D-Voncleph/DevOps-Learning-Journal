# Week 46 Project: Provider Agnosticism and `terraform apply`

Today, I successfully executed a live `terraform apply` to provision infrastructure. To maintain a strict zero-cost agency budget after the expiration of my AWS Free Tier, I executed a strategic pivot from the AWS Provider to the Kubernetes Provider.

## The Multi-Provider Pivot
Terraform's true power lies in its agnostic API interaction. While the curriculum originally called for provisioning physical EKS servers via the `aws` provider, the underlying mechanical lesson is the execution of declarative state management.

I utilized the ephemeral Killercoda cloud sandbox and installed the Terraform CLI. Instead of writing AWS infrastructure, I authored a `main.tf` utilizing the `hashicorp/kubernetes` provider. 

## The Execution
1. I configured Terraform to authenticate via the local `kubeconfig`.
2. I declaratively defined a dedicated `upscale-fintech-env` Namespace and a highly available ReplicaSet Deployment.
3. I ran `terraform init` and `terraform apply -auto-approve`.

The execution was completely successful. Terraform generated the `terraform.tfstate` file and successfully bridged the HashiCorp Configuration Language (HCL) with the Kubernetes API. This project proves that my IaC skills are fully transferable across any cloud provider or API endpoint that Terraform supports, all without incurring a single cent in cloud compute costs.
