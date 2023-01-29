#!/bin/bash


# Update repos
sudo dnf updates

# Ansible and Python dependencies
sudo dnf install python3
sudo dnf install ansible

# Configuring Ansible Community
ansible-galaxy collection install community.general

"$@"

git config --global user.name "Francisco Sanabria"
echo " REMEMBER: git config --global user.email"    
