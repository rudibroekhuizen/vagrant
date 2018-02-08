#!/bin/bash

ANSIBLE_USER="ansible"

# Install Ansible
apt-get update
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# Create Ansible user
adduser --disabled-password --gecos "" $ANSIBLE_USER
mkdir -p /home/$ANSIBLE_USER/.ssh
echo "$ANSIBLE_USER ALL=NOPASSWD:ALL" > /etc/sudoers.d/$ANSIBLE_USER

# Set up keys
ssh-keygen -t rsa -f /vagrant/id_rsa -N ''
mv /vagrant/id_rsa /home/$ANSIBLE_USER/.ssh
chown -R $ANSIBLE_USER:$ANSIBLE_USER /home/$ANSIBLE_USER/.ssh

# Add hosts to hosts file
echo -e '192.168.56.6\n192.168.56.7' >> /etc/ansible/hosts

# Disable ssh host verification
sed -i 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg

# Change roles_path to /etc/ansible/roles
#sed -i 's/#roles_path/roles_path/g' /etc/ansible/ansible.cfg

# Download Ansible base role
#git clone https://github.com/rudibroekhuizen/ansible-base /etc/ansible/roles/base
