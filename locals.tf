locals {
  user_data = <<EOF
#!/bin/bash

curl -sL https://raw.githubusercontent.com/aqua-ps/aqua-training-userscript/${var.bootstrap_version}/user-script.sh | bash -s -- -u ${var.bootstrap_username} -p ${var.bootstrap_password}

EOF
}