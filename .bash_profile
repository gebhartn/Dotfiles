#!/bin/bash

#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=~/.bin:~/.yarn/bin:~/.local/bin:~/.cargo/bin:~/.go/bin:$PATH

[ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && {
    exec startx
}
