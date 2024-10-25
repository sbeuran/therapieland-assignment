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

## Fill in the required parameters for CI/CD pipeline in GitHub Action Secrets.
1. `Kubeconfig` content
```bash
terraform output -raw kubeconfig
```
Copy the output to the Secret `KUBECONFIG_DATA`

2. `Database` IP address (private)
```bash
terraform output -raw therapieland-db-host
```
Copy the output to the Secret `DB_HOST`

4. `Database` user.
You provided this password via `Terraform` variable `gcp-database-instance-user` when executed `terraform apply`. Take it and copy to the 
secret called `DB_USER`

4. `Database` password.
You provided this password via `Terraform` variable `gcp-database-instance-password` when executed `terraform apply`. Take it and copy to the 
secret called `DB_PASS`

4. `Database` name.
You provided this password via `Terraform` variable `gcp-database-name` when executed `terraform apply`. Take it and copy to the 
secret called `DB_NAME`