#!/bin/zsh

zstyle :compinstall filename '/home/brandon/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

HISTFILE=~/.histfile
HISTSIZE=256
SAVEHIST=256

bindkey -e
eval $(dircolors -b)

PROMPT='%B%F{blue}%1~%f%b $ '

preexec() {
  timer=$(($(date +%s%N)/1000000))
}

precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%N)/1000000))
    elapsed=$(($now-$timer))
    export RPROMPT="(%F{%0(?.green.red)}${elapsed}ms%f)"
    unset timer
  else
    export RPROMPT=""
  fi
}

alias ls='ls --group-directories-first --color=auto'
alias tree='tree --dirsfirst'
alias famitracker='wine ~/media/music/famitracker/famitracker.exe'

bindkey '^[[1~' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
