alias nginx-restart='sudo /etc/init.d/nginx configtest && sudo /etc/init.d/nginx restart'
alias upgrade="sudo aptitude update; sudo aptitude upgrade"
alias chmod-standard="find ./ -type d | xargs chmod -v 755 ; find ./ -type f | xargs chmod -v 644"
alias rm-pyc-files="find . -name '*.pyc' -exec rm '{}' ';'"
alias screenshot="gnome-screenshot -i"

alias autostart="vim /home/imbolc/.config/lxsession/LXDE/autostart"
alias timezone="sudo dpkg-reconfigure tzdata"


## System updates

## Colorize the ls output ##
alias ls='ls --color=auto'
 
## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'

alias df='df -H'
alias du='du -cs * | sort -n'
