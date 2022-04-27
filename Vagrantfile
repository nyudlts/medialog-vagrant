# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  
  config.vm.box = "centos/7"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, path: "bootstrap-rails.sh", privileged: false
  config.vm.provision :shell, path: "bootstrap-postgres.sh"
  config.vm.network :forwarded_port, guest: 3000, host: 3100
  config.vm.network :forwarded_port, guest: 80, host: 8000

end