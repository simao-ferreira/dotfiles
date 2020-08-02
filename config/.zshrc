if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export LANG=en_US.UTF-8 
export EDITOR=/usr/bin/nano
export ZSH="$HOME/applications/oh-my-zsh"

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Maybe move all this out of this file
export GRADLE_USER_HOME=$HOME/applications/.gradle
export PULSE_COOKIE=$HOME/.config/pulse/cookie
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COMPDUMP="$HOME/.cache/zsh/zsh_coredump"
CASE_SENSITIVE="false" HIST_STAMPS="dd.mm.yyyy"
HISTFILE="$HOME/.cache/zsh/histfile"

plugins=(git docker docker-compose python) 
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# alias zshconfig="mate ~/.zshrc"

alias btc="bluetoothctl connect"
alias btd="bluetoothctl disconnect"
