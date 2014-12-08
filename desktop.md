Desktop
=======
    # sudo aptitude install lxde
    # sudo aptitude install firmware-iwlwifi vim-nox htop alsa-utils git-core mc rsync screen apache2-utils ntp
    # sudo aptitude install google-chrome flashplugin-nonfree
    # sudo aptitude install keepassx zathura zathura-djvu vlc
    # sudo aptitude install virtualbox
    # sudo aptitude install nginx supervisord


    aptitude install libxml2-dev libxslt1-dev
    aptitude install libcurl4-openssl-dev
    aptitude install libjpeg62-dev libfreetype6-dev
    aptitude install libyaml-dev
    aptitude install postgresql-server-dev-9.4

    aptitude install python-qt4
    pip install zenpad

    aptitude install libreoffice-calc libreoffice-writer
    aptitude install mpg123


Pyenv
-----
    $ sudo aptitude install curl make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev
    $ cd; git clone git://github.com/yyuu/pyenv.git .pyenv
    $ pyenv install 3.4.1
    $ pyenv install 2.7.8
    $ pyenv local 2.7.8 3.4.1


Dependencies of vim plugins
---------------------------
    $ pip3 install flake8
    $ sudo npm install -g jshint js-yaml js-yaml.bin

Locales
-------
    # echo "LANG=en_US.UTF-8" > /etc/default/locale
    # cat > /etc/locale.gen << EOF
    en_US.UTF-8 UTF-8
    ru_RU.UTF-8 UTF-8
    EOF
    # locale-gen


NodeJS
------
    # aptitude install nodejs
    # update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100
    # curl https://www.npmjs.org/install.sh | sudo sh
