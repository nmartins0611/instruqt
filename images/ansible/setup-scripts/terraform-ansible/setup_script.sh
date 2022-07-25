#/bin/bash
# Terraform Lab Setup Script
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# Configure gitea and repo for builds
ansible-playbook /tmp/setup-scripts/terraform-ansible/gitea_setup.yml -e @/tmp/setup-scripts/terraform-ansible/track_vars.yml -i /tmp/setup-scripts/terraform-ansible/inventory.ini

# Configure controller environment 
ansible-playbook /tmp/setup-scripts/terraform-ansible/controller_setup.yml -e @/tmp/setup-scripts/terraform-ansible/track_vars.yml -i /tmp/setup-scripts/terraform-ansible/inventory.ini

# Configure vs-code content
sudo chmod -R 777 /home/rhel/lab_exercises

aws ec2 create-default-vpc
