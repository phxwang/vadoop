vadoop
======

Run hadoop with 3 nodes(master + 2 slaves) on your own pc(laptop)!

System requirements:
 * memory: 8g+
 * os: windows 7 or windows 8

1. Download and install virtualbox
 * https://www.virtualbox.org/wiki/Downloads
 
2. Download and install vagrant
 * http://downloads.vagrantup.com/

3. Add centos 6.4 box
 * Add box
 	
 	```bash
 	vagrant box add centos64_32 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20130731.box
 	```

3. Clone git
```bash
git clone git@github.com:phxwang/vadoop.git
```

4. Get vagrant up
```bash
cd vadoop
vagrant up
```

5. Start hadoop
```bash
vagrant ssh master
./starthadoop.sh
```

6. Visit yarn and dfs web
 * http://192.168.56.111:8088
 * http://192.168.56.111:50070

