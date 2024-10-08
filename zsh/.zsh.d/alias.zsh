#!/bin/bash

alias dotfiles='cd ~/.dotfiles'
alias grep='grep --color=auto'
eval $(thefuck --alias crap)

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Replace cat with bat
alias cat='lolcat'

# Download file and save it with filename of remote file
alias download="curl -O -L"
