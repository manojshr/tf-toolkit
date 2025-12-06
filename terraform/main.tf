terraform {
  required_version = ">= 1.0.0"
}

output "hello" {
  value = "Hello World, This is Terraform Toolkit Runner!"
}

resource "null_resource" "apply_stamp" {
  triggers = {
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    command = "echo 🚀 Apply executed successfully ✅ at ${self.triggers.timestamp}"
  }
}
