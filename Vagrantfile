# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define :dotfiles do |dotfiles|
        dotfiles.vm.hostname = "dotfiles"
        dotfiles.vm.box = "ubuntu/trusty64"
        dotfiles.vm.network "public_network", bridge: ENV.fetch('VAGRANT_NETWORK_IFACE', 'em1')
        config.vm.provision "shell", privileged: true, inline: <<-SHELL
            apt-get update
            apt-get install git python-pip python-dev libffi-dev libssl-dev -y
            pip install markupsafe ansible
            mkdir -p /etc/ansible/roles
            ansible-galaxy install serialdoom.dotfiles
        SHELL
		config.vm.provision "ansible_local" do |ansible|
			ansible.playbook = "/vagrant/dotfiles.yml"
		end
    end
end
