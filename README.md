Setup Debian Wheezy server
==========================

Run from root
-------------
    # cd && wget --no-check-certificate https://raw.github.com/imbolc/jessie-setup/master/root-install.sh && bash root-install.sh

Create user
-----------
    # adduser <username>
    
Remove user sudo password. Add to **/etc/sudoers**

    user ALL=NOPASSWD: ALL


Run from user
-------------
    # su <user>
    $ cd && wget --no-check-certificate https://raw.github.com/imbolc/jessie-setup/master/user-install.sh && bash user-install.sh


Setup ssh pubkey auth
---------------------
Copy pubkey from local mashine:

    local@mashine$ ssh-copy-id <user@sever_ip>
    
Generate local keys:

    ssh-keygen -t rsa


**sudo vim /etc/ssh/sshd_config**

    # disable password auth
    PasswordAuthentication no
    PermitEmptyPasswords no

    # disable root login
    PermitRootLogin no

    # ssh access allowed user list
    AllowUsers <user>

Restart ssh daemon: 

    sudo reboot


Install python
--------------
1. Look at avaliable versions with `pyenv install --list`
2. Install the last versions with `pyenv install <version>`
3. Set default versions with: `cd; pyenv local 2.x.y 3.x.y`

Install postgres
----------------
Add to `/etc/apt/sources.list`:

    deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main   

Run:

    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo aptitude update
    sudo aptitude install postgresql-9.5 postgresql-server-dev-9.5
    sudo su postgres -c "cd /; createuser -s <username>"
