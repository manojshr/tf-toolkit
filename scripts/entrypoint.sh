#!/bin/sh
set -e

cd /terraform

# Default behavior: init → plan → apply
echo "Running default Terraform workflow..."

terraform init
terraform validate
terraform plan

if [ "$TF_AUTO_APPLY" = "true" ]; then
  echo "Applying Terraform changes..."
  terraform apply -auto-approve
  echo "Terraform apply completed."
else
  echo "Skipping apply—set TF_AUTO_APPLY=true to enable"
fi
