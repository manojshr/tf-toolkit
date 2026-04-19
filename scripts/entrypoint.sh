#!/bin/sh
set -e

# TF_CHDIR: path within /terraform to run from (mirrors `terraform -chdir`).
# Enables monorepo usage: mount the full repo, scope with TF_CHDIR.
CHDIR_ARG=""
if [ -n "$TF_CHDIR" ]; then
  CHDIR_ARG="-chdir=/terraform/${TF_CHDIR}"
  echo "Running Terraform with -chdir=/terraform/${TF_CHDIR}"
else
  cd /terraform
  echo "Running Terraform from /terraform"
fi

terraform $CHDIR_ARG init
terraform $CHDIR_ARG validate
terraform $CHDIR_ARG plan

if [ "$TF_AUTO_APPLY" = "true" ]; then
  echo "Applying Terraform changes..."
  terraform $CHDIR_ARG apply -auto-approve
  echo "Terraform apply completed."
else
  echo "Skipping apply — set TF_AUTO_APPLY=true to enable"
fi