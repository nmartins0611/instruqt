#/bin/bash
# Terraform Lab Setup Script
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# Configure gitea and repo for builds
ansible-playbook /tmp/setup-scripts/terraform-ansible/gitea_setup.yml -e @/tmp/setup-scripts/terraform-ansible/track_vars.yml -i /tmp/setup-scripts/terraform-ansible/inventory.ini

# Configure controller environment 
ansible-playbook /tmp/setup-scripts/terraform-ansible/controller_setup.yml -e @/tmp/setup-scripts/terraform-ansible/track_vars.yml -i /tmp/setup-scripts/terraform-ansible/inventory.ini

# Configure vs-code content
# Setup manual content
mv /tmp/setup-scripts/terraform-ansible/main.tf /home/rhel/lab_exercises/1.Terraform_Basics
mv /tmp/setup-scripts/terraform-ansible/main.j2 /home/rhel/lab_exercises/2.Terraform_Ansible
mv /tmp/setup-scripts/terraform-ansible/variables.j2 /home/rhel/lab_exercises/2.Terraform_Ansible

yum install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

sudo chmod -R 777 /home/rhel/lab_exercises

aws ec2 create-default-vpc
