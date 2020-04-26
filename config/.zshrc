# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH. export 
# PATH=$HOME/bin:/usr/local/bin:$PATH

export LANG=en_US.UTF-8 
export EDITOR=/usr/bin/nano
export ZSH="/home/archy/applications/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="false" HIST_STAMPS="dd.mm.yyyy"
plugins=(git docker docker-compose) 

source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# alias zshconfig="mate ~/.zshrc"
export XDG_CONFIG_HOME=/home/archy/.config
