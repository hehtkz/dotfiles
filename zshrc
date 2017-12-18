# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=3000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Minhas configurações ---------------------------------------------------------
PROMPT='%F{red}%n%f %F{yellow}%1~%f %# '
# Isto é para a tecla DELETE funcionar corretamente
# Detalhes: http://zsh.sourceforge.net/Guide/zshguide04.html#l81
bindkey    "^[[3~"          delete-char
# Para ctrl+left e ctrl+right
bindkey    "^[[1;5C"        forward-word
bindkey    "^[[1;5D"        backward-word

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

function preexec() {
  timer=${timer:-$SECONDS}
  echo "$(date +"%F-%T") $2" >> ~/.zsh_archived_hist
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}
# Exports ----------------------------------------------------------------------
export PATH=$HOME/.bin:$HOME/go/bin:$HOME/.gem/ruby/2.4.0/bin:$PATH
export VISUAL=vim
export EDITOR=vim
export TERM=xterm-256color
export LD_LIBRARY=/usr/lib32
# Funções ----------------------------------------------------------------------
mkcd() {
    mkdir $1; cd $1
}

cl() {
    cd $1; ls
}

bin() {
    pacman -Qql $1 | grep '/bin' | grep -v '/opt/' | tail -n +2
}

necinfo() {
        pacman -Qi $1 | awk '/Necess.*/ { print $0 }'
}
fuck() {
    sudo $(fc -ln -1)
}
rmpd() {
    mpc listall | shuf -n 10 | mpc add
}
spaclog() {
    cat /var/log/pacman.log | grep $1
}
# Aliases ----------------------------------------------------------------------
alias n=ncmpcpp
alias pas="pacaur -s --sort votes"
alias pi="pacaur -y"
alias i="sudo pacman -S"
alias r="sudo pacman -Rs"
alias s="pacman -Ss"
alias locals="pacman -Qs"
alias off="sudo systemctl poweroff"
alias up="sudo pacman -Syu"
#alias ror="sudo pacman -Rns $(pacman -Qtdq)"
alias pu="pacaur -u"
alias pu-git="pacaur -Syu --devel --needed"
alias los="pacman -Qs"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

fortune
