locals {
  user_data = <<EOF
#!/bin/bash

curl -sL https://raw.githubusercontent.com/andreazorzetto/aqua-training-userscript/master/user-script.sh | bash -s -- -u ${var.bootstrap_username} -p ${var.bootstrap_password}

EOF
}