#!/bin/bash

echo "=== APTITUDE"

cat > /etc/apt/sources.list << EOF
deb http://cdn.debian.net/debian/ jessie main contrib non-free                                                                      
deb-src http://cdn.debian.net/debian/ jessie main contrib non-free                                                                  
                                                                                                                                    
deb http://security.debian.org/ jessie/updates main contrib non-free                                                                
deb-src http://security.debian.org/ jessie/updates main contrib non-free                                                            
                                                                                                                                    
# jessie-updates, previously known as 'volatile'                                                                                    
deb http://cdn.debian.net/debian/ jessie-updates main contrib non-free                                                              
deb-src http://cdn.debian.net/debian/ jessie-updates main contrib non-free                                                          
                                                                                                                                    
# jessie-backports, previously on backports.debian.org                                                                              
deb http://cdn.debian.net/debian/ jessie-backports main contrib non-free                                                            
deb-src http://cdn.debian.net/debian/ jessie-backports main contrib non-free  

# neovim
deb http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu trusty main
EOF

apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 55F96FCF8231B6DD
aptitude update && aptitude upgrade
aptitude purge apt-xapian-index -y

echo "=== LOCALES"
aptitude install -y locales 
echo "LANG=en_US.UTF-8" > /etc/default/locale
cat > /etc/locale.gen << EOF
en_US.UTF-8 UTF-8
ru_RU.UTF-8 UTF-8
EOF
locale-gen


echo "=== GIT"
aptitude install -y git-core


echo "=== VIM"
rm -R ~/.vim ~/.vimrc
git clone https://github.com/imbolc/.vim ~/.vim
ln -s ~/.vim/.vimrc ~
mkdir ~/.config
ln -s ~/.vim ~/.config/nvim

aptitude install -y neovim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
nvim +PlugInstall +qall


echo "=== INSTALL PACKAGES"
# build PIL from source
aptitude install -y libjpeg-dev libfreetype6-dev

aptitude install -y cron htop screen mc sudo apache2-utils gcc rsync mosh ranger
aptitude install -y nginx supervisor

sudo aptitude install -y curl make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
aptitude install -y python python-setuptools python-dev
