#!/bin/bash

echo "=== SSH"

cd; mkdir .ssh; chmod 700 .ssh; cd .ssh; touch authorized_keys; chmod 600 authorized_keys


echo "=== VIM"

cd; rm -R ~/.vim ~/.vimrc
git clone https://github.com/imbolc/.vim
ln -s ~/.vim/.vimrc ~

update-alternatives --set editor /usr/bin/vim.nox


echo "=== Enable sudo autocomplete"
echo "complete -cf sudo" >> ~/.bashrc

echo "=== Bash aliases"
cat > ~/.bash_aliases << EOF
alias nginx-restart='sudo nginx -t && sudo /etc/init.d/nginx restart'
alias upgrade="sudo aptitude update; sudo aptitude upgrade"
alias chmod-standard="find ./ -type d | xargs chmod -v 755 ; find ./ -type f | xargs chmod -v 644"
alias rm-pyc-files="find . -name '*.pyc' -exec rm '{}' ';'"
EOF

echo "=== Screen"
cat > ~/.screenrc << EOF
startup_message off
defutf8 on
vbell on

# vim colors
term xterm-256color
attrcolor b ".I"
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E38;5;%dm'
defbce "on"

# default buffer of scroll
defscrollback 1000

# activate xterm scroll
termcapinfo xterm* ti@:te@

# Строка состояния
# для авто-названий табов в ~/.bashrc включить:
# export PROMPT_COMMAND='echo -ne "\033k\033\0134"'
shelltitle "$ |bash"
hardstatus alwayslastline "%-w%{= BW}%50>%n %t%{-}%+w%<"
EOF

echo "=== Mercurial config"
cat > ~/.hgrc << EOF
[ui]
username = $(whoami) <$(whoami)@$(hostname)>
EOF

echo "=== Git config"
git config --global user.name $(whoami)
git config --global user.email $(whoami)@$(hostname)
git config --global alias.ci commit
git config --global alias.st status

echo "=== Pyenv"
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
cat > ~/.bashrc << EOF

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi
EOF
