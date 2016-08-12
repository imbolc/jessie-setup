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
EOF

echo "aptitude update"
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
git clone https://github.com/imbolc/.vim
ln -s ~/.vim/.vimrc ~

aptitude install -y vim-nox
update-alternatives --set editor /usr/bin/vim.nox


echo "=== INSTALL PACKAGES"
# build lxml from source
aptitude install -y libxml2-dev libxslt1-dev
# build pycurl from source
aptitude install -y libcurl4-openssl-dev
# build PIL from source
aptitude install -y libjpeg-dev libfreetype6-dev
# build psycopg from source
aptitude install -y postgresql-server-dev-9.4
# build geven from source
aptitude install -y libevent-dev

aptitude install -y cron htop screen mc sudo apache2-utils gcc rsync mosh
aptitude install -y nginx supervisor

sudo aptitude install -y curl make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
aptitude install -y python python-setuptools python-dev
easy_install pip
pip install virtualenv fabric mercurial
