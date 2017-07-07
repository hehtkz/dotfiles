# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Minhas configurações ---------------------------------------------------------
PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '
# Isto é para a tecla DELETE funcionar corretamente
# Detalhes: http://zsh.sourceforge.net/Guide/zshguide04.html#l81
bindkey    "^[[3~"          delete-char
function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
    unset timer
  fi
}
# Exports ----------------------------------------------------------------------
export PATH=$HOME/.bin:$PATH
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
# alias ror="sudo pacman -Rns $(pacman -Qtdq)"
alias pu="pacaur -u"
alias los="pacman -Qs"
alias gedit="env GTK_THEME=Arc-Dark gedit"
alias libreoffice="env GTK_THEME=Arc-Dark libreoffice"
alias lobase="env GTK_THEME=Arc-Dark lobase"
alias localc="env GTK_THEME=Arc-Dark localc"
alias lodraw="env GTK_THEME=Arc-Dark lodraw"
alias loimpress="env GTK_THEME=Arc-Dark loimpress"
alias lomath="env GTK_THEME=Arc-Dark lomath"
alias lowriter="env GTK_THEME=Arc-Dark lowriter"
alias loffice="env GTK_THEME=Arc-Dark loffice"
alias soffice="env GTK_THEME=Arc-Dark soffice"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

