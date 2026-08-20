#!/bin/bash

echo "=================Setup Nginx==================="
# Execute Playbook
# ansible-playbook setup.yml

echo "=================Check Nginx==================="
# Execute Playbook
ansible-playbook status.yml