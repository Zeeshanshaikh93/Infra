# Terraform integrates with cloud-init to configure infrastructure during the initial boot process of a new instance throungh "userdata" input in your instance.

#!/bin/bash
apt update
apt install nginx -y