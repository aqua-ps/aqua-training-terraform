locals {
  user_data = <<EOF
#!/bin/bash

curl -sL https://raw.githubusercontent.com/andreazorzetto/aqua-training-userscript/${var.bootstrap_version}/user-script.sh | bash -s -- -b ${var.bootstrap_version} -u ${var.bootstrap_username} -p ${var.bootstrap_password}

EOF
}