#!/bin/bash

yum install -y rsync
yum install -y vim
yum install -y wget
yum install -y java-1.7.0-openjdk-devel

sudo -u vagrant ssh-keygen -t dsa -P '' -f /home/vagrant/.ssh/id_dsa 
cat /home/vagrant/.ssh/id_dsa.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant /home/vagrant/.ssh/*

cat /vagrant/hosts > /etc/hosts

#install hadoop

wget http://mirror.bit.edu.cn/apache/hadoop/common/hadoop-2.2.0/hadoop-2.2.0.tar.gz -O /home/vagrant/hadoop-2.2.0.tar.gz
#cp /vagrant/hadoop-2.2.0.tar.gz /home/vagrant/
tar -xzf hadoop-2.2.0.tar.gz
cp /vagrant/hadoopconfig/* /home/vagrant/hadoop-2.2.0/etc/hadoop/
cp /vagrant/starthadoop.sh /home/vagrant/
rm /usr/local/hadoop -rf
mv /home/vagrant/hadoop-2.2.0 /usr/local/hadoop
chown vagrant /usr/local/hadoop 
mkdir /hadoop
chown vagrant /hadoop
sudo -u vagrant /usr/local/hadoop/bin/hdfs namenode -format

#set classpath
cat /vagrant/bashrc >> /home/vagrant/.bashrc 

#cp pubkey to /vagrant then to slave
cp /home/vagrant/.ssh /vagrant/ -r

#shutdown firewall
chkconfig --level 35 iptables off

ln -s /usr/local/hadoop/logs logs
