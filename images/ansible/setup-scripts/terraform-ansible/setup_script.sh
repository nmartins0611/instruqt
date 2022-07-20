#/bin/bash
# Terraform Lab Setup Script
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# Configure gitea and repo for builds
ansible-playbook gitea_setup.yml -e @track_vars.yml -i inventory.ini

# Configure controller environment 
ansible-playbook controller_setup.yml -e @track_vars.yml -i inventory.ini

# Configure vs-code content
