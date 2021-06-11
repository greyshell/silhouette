#!/bin/bash

# author: greyshell
# description: configure kali through ansible playbook

echo -e "[+] install ansible \n"
sudo apt update && sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

echo -e "[+] remove ansible source from apt/source.list.d \n"
sudo rm -rf /etc/apt/sources.list.d/ansible-ubuntu-ansible-*.list

echo "[!] finished \n"

