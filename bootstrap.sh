#!/bin/bash

/vagrant/bootstrap_common.sh

#init pub key
sudo -u vagrant ssh-keygen -t dsa -P '' -f /home/vagrant/.ssh/id_dsa 
cat /home/vagrant/.ssh/id_dsa.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant /home/vagrant/.ssh/*

#cp pubkey to /vagrant then to slave
rm /vagrant/.ssh -rf
cp /home/vagrant/.ssh /vagrant/ -r

#install hadoop
wget http://mirror.bit.edu.cn/apache/hadoop/common/hadoop-2.2.0/hadoop-2.2.0.tar.gz -O /home/vagrant/hadoop-2.2.0.tar.gz
tar -xzf hadoop-2.2.0.tar.gz
cp /vagrant/hadoopconfig/* /home/vagrant/hadoop-2.2.0/etc/hadoop/
cp /vagrant/starthadoop.sh /home/vagrant/
mv /home/vagrant/hadoop-2.2.0 /usr/local/hadoop
chown vagrant /usr/local/hadoop 

#setup folder
rm /hadoop -rf
mkdir /hadoop
chown vagrant /hadoop

#init namenode
sudo -u vagrant /usr/local/hadoop/bin/hdfs namenode -format

