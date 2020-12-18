#!/bin/bash

# author: greyshell
# description: configure kali through ansible playbook

# copy the id_ecdsa file content to authorized_keys for remote login
cat ~/.ssh/id_ecdsa.pub > ~/.ssh/authorized_keys
