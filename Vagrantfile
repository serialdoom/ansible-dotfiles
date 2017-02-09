# -*- mode: ruby -*-
# vi: set ft=ruby :

local = ENV.fetch('LOCAL', true)

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
		if local
			config.vm.provision "ansible_local" do |ansible|
				ansible.playbook = "/etc/ansible/roles/serialdoom.dotfiles/dotfiles.yml"
			end
		else
			dotfiles.vm.provision :ansible do |ansible|
				ansible.playbook = 'dotfiles.yml'
			end
		end
    end
end
