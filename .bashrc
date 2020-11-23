#!/bin/bash

#
# ~/.bashrc
#

[ -f ~/.cache/rpg/colors ] && . ~/.cache/rpg/colors
[ -f ~/.config/environment/mopidy ] && . ~/.config/environment/mopidy

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
export GOPATH=~/.go

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias las="stat -c '%A %a %n' *"
alias mkdir="mkdir -pv"
alias gs="git status"
alias gslog="git shortlog"
alias glog="git log --pretty=format:'%n%ar %n%Cred%h %Cblue%an <%ae> %n%Cgreen%s%n' --name-only"
alias glogme="glog --author='\(Nicholas\)\|\(gebhartn\)'"
alias vim="nvim"
alias fuck='sudo $(history -p !!)'
alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'
alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias pro="cd ~/projects/"
alias pkg="cd ~/packages"

rpg r
