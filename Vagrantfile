# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
	v.cpus = 2
  end
  
  config.vm.box = "hansode/fedora-21-server-x86_64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision "puppet"
  config.vm.provision :shell, path: "bootstrap-vagrant.sh", privileged: false
  config.vm.network :forwarded_port, guest: 3000, host: 3100

end