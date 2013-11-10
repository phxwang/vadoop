# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64_32"

  config.vm.provider :virtualbox do |v, override|
    #override.vm.box_url = "http://files.vagrantup.com/lucid64.box"
    v.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.define :master do |vmconfig|
    vmconfig.vm.hostname="master"
    vmconfig.vm.network "private_network", ip: "192.168.56.111"
    vmconfig.vm.provision :shell, :path => "bootstrap.sh"
  end

  config.vm.define :slave0 do |vmconfig|
    vmconfig.vm.hostname="slave0"
    vmconfig.vm.network "private_network", ip: "192.168.56.112"
    vmconfig.vm.provision :shell, :path => "bootstrap_slave.sh"
  end

  config.vm.define :slave1 do |vmconfig|
    vmconfig.vm.hostname="slave1"
    vmconfig.vm.network "private_network", ip: "192.168.56.113"
    vmconfig.vm.provision :shell, :path => "bootstrap_slave.sh"
  end
  
end
