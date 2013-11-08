vadoop
======

1. download vagrant and add centos 6.4 box
 * http://downloads.vagrantup.com/
 * add box
 	
 	```bash
 	vagrant box add centos64_32 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20130731.box
 	```

2. clone git
```bash
git clone git@github.com:phxwang/vadoop.git
```

3. get vagrant up
```bash
cd vadoop
vagrant up
```

4. start hadoop
```bash
vagrant ssh master
./starthadoop.sh
```

5. visit yarn and dfs web
	* http://192.168.56.111:8088
	* http://192.168.56.111:50070

