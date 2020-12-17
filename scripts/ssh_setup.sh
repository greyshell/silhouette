#!/bin/bash

# author: greyshell
# description: configure kali through ansible playbook

# copy the id_ecdsa file content to authorized_keys for remote login
echo ~/.ssh/id_ecdsa.pub >> authorized_keys
