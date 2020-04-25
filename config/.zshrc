# If you come from bash you might have to change your $PATH. export 
# PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/home/archy/applications/oh-my-zsh"
ZSH_THEME="agnoster"
#ZSH_THEME="gallois"

CASE_SENSITIVE="false" HIST_STAMPS="dd.mm.yyyy"

plugins=(git docker docker-compose) source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8 export EDITOR=nano

# alias zshconfig="mate ~/.zshrc"

# AGNOSTER USER
prompt_context() {
  prompt_segment black default "%(!.%{%F{yellow}%}.)TPB"
}
