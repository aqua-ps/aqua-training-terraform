locals {
  user_data = <<EOF
#!/bin/bash

curl -sL https://raw.githubusercontent.com/andreazorzetto/aqua-playground-userscript/master/user-script.sh | bash -

EOF
}