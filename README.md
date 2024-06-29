# Infrastructure for Wazuh SIEM
Basic Terraform configuration to create a instance to deploy Wazuh SIEM

## Terraform Infrastructure as Code (IaC) Repository

This repository contains Terraform code to provision and manage infrastructure on Amazon Web Services using Infrastructure as Code (IaC) principles.

### Prerequisites

Before you begin, ensure you have the following tools installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- An [AWS account](https://aws.amazon.com/free/?all-free-tier) and the [associated credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-creds.html) that allow you to create resources. These credentials must be configured for the AWS provider (see [Authentication and Configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration) section in AWS terraform provider documentation.)

### Related Repositories

Repository of a basic network to be analyzed by the SIEM: 
[Infrastructure for Cybersecurity Lab](https://github.com/xavierventeo/cybersecurity-lab)

### Usage

1. Clone this repository to your local machine:

```bash
git clone git@github.com:xavierventeo/terraform-wazuh-aws-ec2-elastic-ip.git
```

2. Navigate to the repository directory:

```bash
cd terraform-wazuh-aws-ec2-elastic-ip
```

3. Initialize Terraform:

```bash
terraform init
```

4. Configure terraform variables with your own values

    Pay attention to configure **allowed_ip_address** variable in order to allow external access to your own IP
   
```bash
cp terraform.tfvars.example terraform.tfvars
vi terraform.tfvars
```

5. Plan the infrastructure changes:

```bash
terraform plan
```

6. Apply the infrastructure changes to your AWS Account:

```bash
terraform apply
```

Confirm the action by typing 'yes' when prompted.

### Cleanup

To destroy the infrastructure provisioned by Terraform, run:

```bash
terraform destroy
```

Confirm the action by typing 'yes' when prompted.
