## Role Name

basic configurations for a fresh kali instance

### Requirements

- enable password less sudo.
```
# ref: https://www.kali.org/docs/general-use/sudo/
sudo apt install -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root
```
- install xrdp and start the service
 - resolve the block mouse pointer issue: /etc/xrdp/xrdp.ini => set new_cursors=false
- enable auto login for root for raspberry-pi
```
# check the default deiplay manager
vim /etc/X11/default-display-manager
# edit /etc/lightdm/lightdm.conf -> set autologin-user=kali and reboot
```
- copy the my ssh pub key to the target system. it creates `authorized_keys` file in target system's `~/.ssh/` directory.
```
ssh-copy-id target_remote_system 
```
- in target system, enable ssh and start the service automatically at boot time.
```
# start the service
sudo service ssh start
alternate: sudo systemctl start ssh.service

# enable at boot
update-rc.d ssh enable
alternate: sudo systemctl enable ssh.service
```
- in target system, configure `/etc/ssh/sshd_config` to disable password based authN and root login. restart the service.
```
PasswordAuthentication no -> line no: 58
ChallengeResponseAuthentication no -> line no: 63
UsePAM no -> line no: 86

PermitRootLogin no -> add this line before line no: 34 (# PermitRootLogin prohibit-password)

sudo service ssh restart
```
- check the `~/.ssh` directory permission is 700 and authorized_keys permission is 644.
```
chmod 644 authorized_keys
stat -c '%a %A %n' authorized_keys
```

- add the ssh key to the ssh-agent so that it can take the cert passphrase from there.
```
eval "$(ssh-agent -s)" && ssh-add
``` 

### example playbook

    - hosts: '{{ host }}'
      roles:
         - basic

### author

ABHIJIT SINHA (greyshell)