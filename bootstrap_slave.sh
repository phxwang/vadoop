#!/bin/bash

/vagrant/bootstrap_common.sh

#setup ssh key
sudo -u vagrant cp /vagrant/.ssh /home/vagrant/ -r
chmod 600 /home/vagrant/.ssh/id_dsa

#cp hadoop files
sudo -u vagrant scp -r vagrant@master:/usr/local/hadoop /home/vagrant/hadoop
rm /usr/local/hadoop -rf
mv /home/vagrant/hadoop /usr/local/
chown vagrant /usr/local/hadoop

#setup hadoop
rm /hadoop -rf
mkdir /hadoop
chown vagrant /hadoop