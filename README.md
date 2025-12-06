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

## Docker Hub
👉 https://hub.docker.com/r/manojshrr/tf-toolkit


## 🤝 Contributing

PRs welcome!
For issues or ideas, open a discussion or issue.
Github 👉 https://github.com/manojshr/tf-toolkit
