#/bin/bash
# Terraform Lab Setup Script

# Configure gitea and repo for builds
ansible-playbook gitea_setup.yml -e @track_vars.yml -i inventory.ini

# Configure controller environment 
ansible-playbook controller_setup.yml -e @track_vars.yml -i inventory.ini

# Configure vs-code content
