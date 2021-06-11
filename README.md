# silhouette

#### playbook to configure my kali

- install ansible by executing `install_ansible.sh`

- verify the inventory.yml
```
ansible all --list-hosts -i inventory.yml  
```

- test remote / target system connectivity
```
ansible mac_vm,raspberry_pi -i inventory.yml -m ping
```

- run playbook on remote system
```
# note: no space after comma and before another host
ansible-playbook -i kali_inventory.yml --extra-vars "host=mac_vm,raspberry_pi", kali_playbook.yml
```