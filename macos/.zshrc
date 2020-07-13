if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export LANG=en_US.UTF-8 
export EDITOR=/usr/bin/nano
export ZSH="/Users/simaof/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COMPDUMP="$HOME/.cache/zsh/zsh_coredump"
CASE_SENSITIVE="false" HIST_STAMPS="dd.mm.yyyy"
HISTFILE="$HOME/.cache/zsh/histfile"

plugins=(git docker docker-compose python)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# alias zshconfig="mate ~/.zshrc"

# #PROMPT
# DEFAULT_USER=simaof@DE-MUC1-MAC0041
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "🍺"
#   fi
# }

#DEV
