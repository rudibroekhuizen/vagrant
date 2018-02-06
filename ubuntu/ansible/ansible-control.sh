#!/bin/bash

sudo apt-get update
#sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible

su vagrant -c "ssh-keygen -t rsa -f /vagrant/id_rsa -N ''"
su vagrant -c "mv /vagrant/id_rsa ~/.ssh/"
