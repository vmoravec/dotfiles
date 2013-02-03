# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

alias treet="tree -L 3"
alias treed="tree -L 2"
alias treej="tree -L 1"
alias lsa="ls -al"
alias ls="ls --color"
alias grep="grep --color"
alias isc="osc --apiurl=https://api.suse.de -v --no-keyring"

set -o vi

HISTFILESIZE=5000
HISTSIZE=5000

# show the current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
  }

# modify the prompt
PS1='\[\033[01;37m\]\w\[\033[00;33m\]$(parse_git_branch)\[\033[00m\] \n∴ '

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# set the DISPLAY var if not set
# if [ ! $DISPLAY ] ; then
#     if [ "$SSH_CLIENT" ] ; then
#         export DISPLAY=`echo $SSH_CLIENT|cut -f1 -d\ `:0.0
#     fi
# fi
# [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
