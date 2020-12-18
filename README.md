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

- configure git with verified commit with GPG
```
git config --global user.email "grey.shell@gmail.com"
git config --global user.name "ABHIJIT SINHA"
gpg --import /mnt/hgfs/Downloads/GPG_keys/ABHIJIT\ SINHA\ \(F59D0874\)\ –\ Secret.asc  => provide GPG password
gpg --list-secret-keys --keyid-format LONG => pick up the secret id
git config --global user.signingkey AB7AB709F59D0874
git config --global commit.gpgsign true      
```
- create .vimrc file and set line numner, tabstop
```
syntax enable
set number
set autoindent
set tabstop=2
set softtabstop=2
```

- install pyenv and virtual env / python env
```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc       
exec "$SHELL"
sudo apt-get install build-essential checkinstall libffi-dev python-dev
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
pyenv install 3.9.1  
pyenv install 2.7.18
pyenv virtualenv 2.7.18 alpha
pyenv virtualenv 3.9.1 playbook
pyenv virtualenv 3.9.1 venv

```

- install xrdp
  - resolve the block mouse pointer issue: /etc/xrdp/xrdp.ini => set new_cursors=false
  
- configure sublime
  

- install other languages
- install the jetbrains products
- install vs code
- install tmux
- copy the notsosuecure tools
- configure puteftpd and tftpd
- check the apache and file upload script working
- set up the .zshrc
- set up the .profile
- install burp pro
- configure the browsers, add burp pro cert
  - install chrome

- install afl -> ask dhaval to provide the script to install the dependency
  - onegadget
  - pwntools
 
- install docker
- UI twiks
 



