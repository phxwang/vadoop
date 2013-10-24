#!/bin/bash

cp /vagrant/sources.list.precise /etc/apt/sources.list
apt-get update
#apt-get install -y apache2
apt-get install -y ssh
apt-get install -y rsync
apt-get install -y vim
#rm -rf /var/www
#ln -fs /vagrant /var/www
apt-get install -y openjdk-7-jdk

#sudo addgroup hadoop
#sudo adduser --ingroup hadoop -q --disabled-password hduser
#sudo -u hduser ssh-keygen -t dsa -P '' -f /home/hduser/.ssh/id_dsa 
#sudo -u hduser cat /home/hduser/.ssh/id_dsa.pub >> /home/hduser/.ssh/authorized_keys
ssh-keygen -t dsa -P '' -f /home/vagrant/.ssh/id_dsa 
cat /home/vagrant/.ssh/id_dsa.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant /home/vagrant/.ssh/*

wget http://mirror.bit.edu.cn/apache/hadoop/common/hadoop-2.2.0/hadoop-2.2.0.tar.gz -O /home/vagrant/hadoop-2.2.0.tar.gz
#cp /vagrant/hadoop-2.2.0.tar.gz /home/vagrant/
tar -xzf hadoop-2.2.0.tar.gz
cp /vagrant/hadoopconfig/* /home/vagrant/hadoop-2.2.0/etc/hadoop/
cp /vagrant/starthadoop.sh /home/vagrant/
mv /home/vagrant/hadoop-2.2.0 /usr/local/hadoop
chown vagrant /usr/local/hadoop 
mkdir /hadoop
chown vagrant /hadoop
sudo -u vagrant /usr/local/hadoop/bin/hdfs namenode -format

