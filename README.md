# Terraform Projects

## _Provisioning by studying based on practical usecases_

Personal projects served only for learning purposes only.

## Installation

- Required AWS CLI configured with keys.
- Terraform installed.

```bash
cd <desired project>
terraform init # Initialize all providers and dependencies for application requirements.

terraform plan # To verify what you are going to provision.

terraform apply --auto-approve # Actual provisioning comand.

terraform destroy --ato-approve # Cleaning resources.
```
