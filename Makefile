#
# Makefile

default: remote

remote: roles/geerlingguy.homebrew
	LOCAL=0 vagrant up

local:
	vagrant up

roles/geerlingguy.homebrew:
	ansible-galaxy install geerlingguy.homebrew

clean:
	vagrant destroy -f
	

# vim:ft=make
#
