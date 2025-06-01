#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias git='[[ $PWD == "/" ]] && echo "Refusing to run git in /" || command git'
alias rm='[[ $PWD == "/" ]] && echo "🚫 Refusing to delete root directory!" || command rm'

export PATH=~/.npm-global/bin:/usr/local/bin:/usr/bin
