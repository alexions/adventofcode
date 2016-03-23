# -*- mode: ruby -*-
# vi: set ft=ruby :

HOST_NAME = "aoc.dev"
HOST_IP = "192.168.10.11"

unless Vagrant.has_plugin?("vagrant-hostmanager")
  puts "This Vagrant environment requires the 'vagrant-hostmanager' plugin."
  puts "Please run `vagrant plugin install vagrant-hostmanager` and then run this command again."
  exit 1
end

unless Vagrant.has_plugin?("vagrant-vbguest")
  puts "This Vagrant environment requires the 'vagrant-vbguest' plugin."
  puts "Please run `vagrant plugin install vagrant-vbguest` and then run this command again."
  exit 1
end

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.box_check_update = false

  # SSH settings
  config.ssh.forward_agent = true

  # Network provision
  config.vm.network :private_network,
    ip: HOST_IP,
    netmask: "255.255.255.0"
  config.vm.hostname = HOST_NAME

  # Provision with Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
  end

  config.vm.provider :virtualbox do |vbox|
    vbox.customize ["modifyvm", :id, "--memory", 2048]
    vbox.customize ["modifyvm", :id, "--cpus", 1]
  end
end