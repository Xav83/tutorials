#!/bin/bash

echo "Installs VirtualBox"

echo "-- Adding Oracle repository to be used as a source to look into"

sudo add-apt-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"

echo "-- Downloading and adding Oracle public key for apt-secure"

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo "-- Installing VirtualBox itself"

sudo apt-get update
sudo apt-get install virtualbox-6.0

echo "-- Displays informations on the VirtualBox installed"

virtualbox --help
