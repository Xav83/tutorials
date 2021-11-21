#!/bin/bash

echo "Installs VirtualBox"

echo "-- Adding Oracle repository to be used as a source to look into"

sudo add-apt-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"

echo "-- Downloading and adding Oracle public key for apt-secure"

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo "-- Installing VirtualBox itself"

sudo apt-get install virtualbox virtualbox-guest-additions-iso
sudo apt-get --reinstall install virtualbox-dkms

echo "-- Displays informations on the VirtualBox installed"

virtualbox --help

echo "Installs Vagrant"

echo "-- Installs Vagrant package"

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install vagrant

echo "-- Displays informations on the VirtualBox installed"

vagrant --version

echo "-- Installs Vagrant plugins"

vagrant plugin update
vagrant plugin install winrm
vagrant plugin install wimrm-fs
vagrant plugin install wimrm-elevated

echo "Clones Chocolatey test environment"

git clone https://github.com/chocolatey-community/chocolatey-test-environment.git

echo "Launchs the virtual environment with Vagrant"

cd chocolatey-test-environment
sed -i 's/v.gui = true//g' Vagrantfile
sed -i 's/vb.customize ["modifyvm", :id, "--cpus", "2"]/vb.cpus = 1/g'  Vagrantfile
vagrant up
