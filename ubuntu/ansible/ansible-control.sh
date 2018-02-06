#!/bin/bash

# Install Ansible
sudo apt-get update
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible

# Set up keys
su vagrant -c "ssh-keygen -t rsa -f /vagrant/id_rsa -N ''"
su vagrant -c "mv /vagrant/id_rsa ~/.ssh/"

# Add hosts to hosts file
sed -i 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg

# Disable ssh host verification
sed -i 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg
