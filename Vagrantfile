# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-buster64"
  config.vm.provider :virtualbox do |vm|
    vm.memory = 4096
    vm.cpus = 2
  end

  config.vm.network :forwarded_port, guest: 22, host: 2292, id: "ssh"

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "playbook.yml"
  end

end
