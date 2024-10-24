# Therapieland Assignment project

## GCP initial configuration
1. Create new project, say `Therapieland`
2. Create service account for `terraform`, give it at `Editor` and `Compute Network Admin` permissions.
3. Generate key for `terraform` service account and save it, say in file `therapieland-terraform-key.json`

## Terraform
1. Navigate to the `terraform` directory
```bash
cd terraform
```
2. Initialise terraform
```bash
terraform init
```
3. Update the `tfvars/default.tfvars` as needed
4. Apply the terraform configuration
```bash
terraform apply --var-file=tfvars/default.tfvars
```