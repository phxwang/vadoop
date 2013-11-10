#!/bin/bash

/vagrant/bootstrap_common.sh

#setup ssh key
sudo -u vagrant cp /vagrant/.ssh /home/vagrant/ -r
chmod 600 /home/vagrant/.ssh/id_dsa
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

#cp hadoop files
scp -i /home/vagrant/.ssh/id_dsa -r vagrant@master:/usr/local/hadoop /usr/local/
chown vagrant /usr/local/hadoop

#setup hadoop
rm /hadoop -rf
mkdir /hadoop
chown vagrant /hadoop