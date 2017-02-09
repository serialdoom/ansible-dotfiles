#
# Makefile

default: remote

remote:
	LOCAL=0 vagrant up

local:
	vagrant up

clean:
	vagrant destroy -f
	

# vim:ft=make
#
