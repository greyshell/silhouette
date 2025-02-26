# silhouette


## playbook to configure my kali

- register all systems in `inventory.yml`
- create an ansible vault with password and store all systems password in key value format
```
# create the vault -> secret.yml, set a password (example: asinha)
ansible-vault create secrets.yml  

# edit the vault with to add other entries
ansible-vault edit group_vars/all/secrets.yml
```
- include the `secrets.yml` file in gitignore.

## how to run - ping test

```bash
# ping a one target
ansible -i inventory.yml lab_vulnapp_docker --ask-vault-pass -m ping

# ping a group
ansible -i inventory.yml docker_lab --ask-vault-pass -m ping

# ping all systems
ansible -i inventory.yml all --ask-vault-pass -m ping
```

## create a role

```bash
# create the template folder for roles
ansible-galaxy init role_name

# view the existing roles
ansible-galaxy list

# find a role from community: https://galaxy.ansible.com
ansible-galaxy search role_name

# install the community role in default location
# specify the role in the playbook using role_name (i.e. geerlingguy.mysql)
ansible-galaxy install role_name

# install the role in current directory
ansible-galaxy install role_name -p ./roles

# get the path where roles are stored by default
ansible-config dump | grep ROLE


```

- create a role under `roles` folder

## run the playbook

- create `<os>_playbook.yml`

```bash
# run on a single target
ansible-playbook -i inventory.yml docker_lab_playbook.yml --limit lab_vulnapp_docker --ask-vault-pass
ansible-playbook -i inventory.yml docker_lab_playbook.yml --limit lab_vulnapp_docker --vault-password-file group_vars/all/ansible_vault_password.txt

# run on a group
ansible-playbook -i inventory.yml docker_lab_playbook.yml --limit docker_lab --ask-vault-pass

# run on all
ansible-playbook -i inventory.yml docker_lab_playbook.yml --ask-vault-pass

```

## Advanced commands

```bash
# dry run the playbook without actually executing the tasks
ansible-playbook -i inventory.yml docker_lab_playbook.yml --limit lab_ansible_node1 --vault-password-file group_vars/all/ansible_vault_password.txt --check

# specify a task to start 
# if tasks that are directly written inside the playbook
ansible-playbook -i inventory.yml docker_lab_playbook.yml --limit lab_ansible_node1 --vault-password-file group_vars/all/ansible_vault_password.txt --start-at-task "install packages"
ansible-playbook -i inventory.yml docker_lab_playbook.yml --limit lab_ansible_node1 --vault-password-file group_vars/all/ansible_vault_password.txt --tags "install packages"
ansible-playbook -i inventory.yml docker_lab_playbook.yml --limit lab_ansible_node1 --vault-password-file group_vars/all/ansible_vault_password.txt --skip-tags "install packages"
```

### ansible facts
- gather all info about the system via setup module automatically (by default, under the hood)

#### explicitly gather all the facts
```
-
- name: print hello
  hosts: all
  tasks:
  - debug:
    var: ansible_facts
```

#### public key baed authN

```
# copy the ssh pub key to the remote system from ansible control node
ssh-copy-id -i ~/.ssh/id_ecdsa root@192.168.0.86
```

#### run ad-hoc commands

```
ansible -i inventory.yml lab_ansible_node1 --ask-vault-pass -a "cat /etc/passwd"
```