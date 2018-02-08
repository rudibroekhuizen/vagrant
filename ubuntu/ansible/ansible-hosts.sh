#!/bin/bash

ANSIBLE_USER="ansible"

# Create Ansible user
adduser --disabled-password --gecos "" $ANSIBLE_USER
mkdir -p /home/$ANSIBLE_USER/.ssh
echo "$ANSIBLE_USER ALL=NOPASSWD:ALL" > /etc/sudoers.d/$ANSIBLE_USER

# Manage public key
cat /vagrant/id_rsa.pub >> /home/$ANSIBLE_USER/.ssh/authorized_keys
chown -R $ANSIBLE_USER:$ANSIBLE_USER /home/$ANSIBLE_USER/.ssh
chmod 600 /home/$ANSIBLE_USER/.ssh/authorized_keys
