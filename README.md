# silhouette

brief steps to configure my kali.

- install the vmtools (SKIP this for 2020.4)
```
cp /media/cdrom0/VMware*.tar.gz . && tar -zxvf VMwareTools-*.tar.gz && cd vmware-tools-distrib/ && \ 
chmod +x vmware-install.pl && sudo ./vmware-install.pl -d default && cd .. && \
sudo rm -rf vmware-tools-distrib/ && sudo rm VMwareTools-*.tar.gz
```

- enable password less sudo.
- https://www.kali.org/docs/general-use/sudo/
```
sudo apt install -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root
```

- mount the share folder and pin into the sidebar.
```
sudo crontab -l > temp; echo "@reboot /usr/local/sbin/mount-shared-folders" >> temp; crontab file; rm temp
```

- install dropbox dependency
```
sudo apt install libpango1.0-0
```

- download the latest dropbox install using dpkg.
  - sign-in
  - copy the pentest folder from macos.
  - selective sync: only pentest folder.

- configure the mousepad
  - show line, matching bracket, highlight current line, wrap
  - tab width = 2, insert space
  - auto indentation, show status
  
- configure SSH with git
  - `ssh-add ~/.ssh/id_ecdsa`
  - `sudo passwd root`
  - `cat ~/.ssh/id_ecdsa.pub >> authorized_keys`
  - copy .ssh/ to root home directory 
  - trun off password based ssh authentication & restart the ssh service

- add the github user name and email
```
git config --global user.email "grey.shell@gmail.com"
git config --global user.name "ABHIJIT SINHA"
gpg --import /mnt/hgfs/Downloads/GPG_keys/ABHIJIT\ SINHA\ \(F59D0874\)\ –\ Secret.asc  => provide GPG password
gpg --list-secret-keys --keyid-format LONG => pick up the secret id
git config --global user.signingkey AB7AB709F59D0874
git config --global commit.gpgsign true      
```



