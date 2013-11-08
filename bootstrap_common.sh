#!/bin/bash

yum install -y rsync
yum install -y vim
yum install -y wget
yum install -y java-1.7.0-openjdk-devel

#set hosts
cat /vagrant/hosts > /etc/hosts

#set classpath
cat /vagrant/bashrc >> /home/vagrant/.bashrc 

#shutdown firewall
chkconfig --level 35 iptables off
service iptables stop

ln -s /usr/local/hadoop/logs logs
