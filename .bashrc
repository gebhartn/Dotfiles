#!/bin/bash

#
# ~/.bashrc
#

[ -f ~/.cache/pap/colors ] && . ~/.cache/pap/colors

export PS1="-> "
export PLUG=~/.local/share/nvim/site/pack/
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DESKTOP_DIR=~/
export XDG_MUSIC_DIR=~/media/music
export XDG_DOWNLOAD_DIR=~/media/downloads
export XDG_PICTURES_DIR=~/media/pictures
export XDG_VIDEOS_DIR=~/media/videos
export XDG_DOCUMENTS_DIR=~/media/documents
export EDITOR="nvim"
export VISUAL="nvim"
export DRT_PATH=~/projects
export PAP_DIR=~/media/palettes
export GOPATH=~/.go
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sudo='sudo '
alias fuck='sudo $(history -p !!)'
alias ls='ls --color=always'
alias las="ls -h --author --time-style=long-iso -dUl -- .* * | awk '{if(NR>2)print \$5, \$7, \$9}'"
alias mkdir="mkdir -pv"
alias gs="git status"
alias gslog="git shortlog"
alias glog="git log --pretty=format:'%n%ar %n%Cred%h %Cblue%an <%ae> %n%Cgreen%s%n' --name-only"
alias glogme="glog --author='\(Nicholas\)\|\(gebhartn\)'"
alias vim="nvim"
alias orphans='sudo pacman -Qtdq | sudo pacman -Rns -'
alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'
alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias pro="cd ~/projects/"
alias pkg="cd ~/packages"
alias dwn="cd ~/media/downloads"
alias mus="cd ~/media/music"

/usr/local/bin/pap r
