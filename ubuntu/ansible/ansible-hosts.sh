#!/bin/bash

su vagrant -c "cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys"
su vagrant -c "chmod og-wx ~/.ssh/authorized_keys"
