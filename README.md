# 🚀 Terraform Toolkit Runner

A lightweight and flexible Docker image for running Terraform without installing anything on host machine.  
Bind-mount any Terraform directory at runtime and run plans, applies.

---

## 🔧 Components
- 🚀 Run Terraform command (`init`, `plan`, `apply`) within docker container
- 📁 Bind-mount your Terraform code into `/terraform`
- 📝 Optional auto-apply (`TF_AUTO_APPLY=true`)

---

## 🏗 Usage

### Run Terraform
```sh
docker run -v $(pwd):/terraform manojshrr/tf-toolkit
```

### Default behavior
Running with no arguments:
```sh
terraform init
terraform plan
```
**TF Auto Apply**
```sh
docker run -e TF_AUTO_APPLY=true -v $(pwd):/terraform manojshrr/tf-toolkit
```


## Docker Compose Usage
```yaml
services:
  tf-toolkit:
    image: manojshrr/tf-toolkit:latest
    volumes:
      - ./terraform:/terraform
    environment:
      - TF_AUTO_APPLY=false
```


## Monorepo / Multi-environment Usage

For repos with multiple environments in subdirectories:
```
my-infra/
├── modules/
│ ├── s3/
│ └── sqs/
└── environments/
├── dev/
└── prod/
```

Mount the full repo and use `TF_CHDIR` to scope:
```sh
docker run --rm \
  -e TF_CHDIR=environments/dev \
  -v $(pwd):/terraform \
  manojshrr/tf-toolkit
TF_CHDIR maps to Terraform's native -chdir flag — relative module
sources like ../../modules/s3 resolve correctly.
```
---
**`stream-weaver-infra` — the final, standard run command**
Once the toolkit is updated:
```bash
# from inside stream-weaver-infra/
docker run --rm \
  --platform linux/amd64 \
  -e TF_CHDIR=terraform/environments/local \
  -e TF_AUTO_APPLY=true \
  -v $(pwd):/terraform \
  manojshrr/tf-toolkit:latest
```

## Docker Hub
👉 https://hub.docker.com/r/manojshrr/tf-toolkit


## 🤝 Contributing

PRs welcome!
For issues or ideas, open a discussion or issue.
Github 👉 https://github.com/manojshr/tf-toolkit
