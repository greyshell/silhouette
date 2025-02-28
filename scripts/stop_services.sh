#!/bin/bash

# author: greyshell
# description: disable unnecessary services if any

# open tcp ports
netstat -antp
# open udp ports
sudo ss -ulnp
