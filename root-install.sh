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
# psmsic --> pkill
# apache-utils --> ab
# libxml2-dev libxslt1-dev --> build lxml from source
# libcurl4-openssl-dev --> build pycurl from source
# libjpeg62-dev libfreetype6-dev --> build PIL from source
# postgresql-server-dev-9.4 --> build psycopg from source
aptitude install -y libxml2-dev libxslt1-dev
aptitude install -y libcurl4-openssl-dev
aptitude install -y libjpeg62-dev libfreetype6-dev
aptitude install -y postgresql-server-dev-9.4
#aptitude install -y libevent-dev

aptitude install -y cron htop screen mc sudo apache2-utils gcc rsync
aptitude install -y nginx runit

aptitude install -y python python-setuptools python-dev
easy_install pip
pip install virtualenv fabric mercurial
