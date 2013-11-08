#!/bin/bash

yum install -y rsync
yum install -y ssh
yum install -y java-1.7.0-openjdk-devel

#setup ssh key
sudo -u vagrant cp /vagrant/.ssh /home/vagrant/ -r
sudo chmod 600 /home/vagrant/.ssh/id_dsa

#setup hosts
cat /vagrant/hosts > /etc/hosts

#cp hadoop files
sudo -u vagrant scp -r vagrant@master:/usr/local/hadoop /home/vagrant/hadoop
rm /usr/local/hadoop -rf
mv /home/vagrant/hadoop /usr/local/
chown vagrant /usr/local/hadoop

#setup hadoop
rm /hadoop -rf
mkdir /hadoop
chown vagrant /hadoop

#setup classpath
cat /vagrant/bashrc >> /home/vagrant/.bashrc 

#shutdown firewall
chkconfig --level 35 iptables off

ln -s /usr/local/hadoop/logs logs