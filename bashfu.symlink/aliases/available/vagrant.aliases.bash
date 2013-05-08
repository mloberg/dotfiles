#!/usr/bin/env bash

# Aliases
alias vin='vagrant init'
alias vup='vagrant up'
alias vssh='vagrant ssh'
alias vdel='vagrant destroy'
alias valt='vagrant halt'

function vagrant-help() {
	echo "Vagrant Custom Aliases Usage"
	echo
	echo "  vin     = vagrant init"
	echo "  vup     = vagrant up"
	echo "  vssh    = vagrant ssh"
	echo "  valt    = vagrant halt"
	echo "  vdel    = vagrant destroy"
	echo
}
