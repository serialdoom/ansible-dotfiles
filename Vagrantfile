# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define :dotfiles do |dotfiles|
        dotfiles.vm.hostname = "dotfiles"
        dotfiles.vm.box = "ubuntu/trusty64"
        dotfiles.vm.network "public_network", bridge: ENV.fetch('VAGRANT_NETWORK_IFACE', 'em1')
        dotfiles.vm.provision :ansible do |ansible|
            ansible.playbook = 'dotfiles.yml'
            ansible.sudo = true
            ansible.limit = 'all'
            ansible.groups = {
                'all' => ['dotfiles'],
            }
        end
    end
end
