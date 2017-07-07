#!/bin/bash

set -e

suc() {
  echo $1' - instalado'
}

exi() {
  echo $1' - backup realizado'
}

install_xinitrc() {
  [[ -f $HOME/.xinitrc ]] && mv $HOME/.xinitrc $HOME/.xinitrc.old && exi 'xinitrc'
  ln -s $(pwd)/xinitrc $HOME/.xinitrc && suc 'xinitrc'
}

install_vim() {
  [[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc.old && exi 'vimrc'
  ln -s $(pwd)/vimrc $HOME/.vimrc && suc 'vimrc'
  git clone -q https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim && suc 'vundle'
  echo 'execute :PluginInstall no vim'
  [[ -d $HOME/.vim/colors ]] && mv $HOME/.vim/colors $HOME/.vim/colors.old && exi 'vim colors'
  ln -s $(pwd)/vim/colors $HOME/.vim/colors && suc 'vim colors'
}

install_xresources() {
  [[ -f $HOME/.Xresources ]] && mv $HOME/.Xresources $HOME/.Xresources.old && exi 'Xresources'
  ln -s $(pwd)/Xresources $HOME/.Xresources && suc 'Xresources'
}

install_zsh() {
  [[ -f $HOME/.zshrc ]] && mv $HOME/.zshrc $HOME/.zshrc.old && exi 'zshrc'
  ln -s $(pwd)/zshrc $HOME/.zshrc && suc 'zshrc'
  [[ -d $HOME/.zsh ]] && mv $HOME/.zsh $HOME/.zsh.old
  git clone -q git://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions && suc 'zsh-autosuggestions'
}

install_gtk2() {
  [[ -f $HOME/.gtkrc-2.0 ]] && mv $HOME/.gtkrc-2.0 $HOME/.gtkrc-2.0.old && exi 'gtkrc-2.0'
  ln -s $(pwd)/gtkrc-2.0 $HOME/.gtkrc-2.0 && suc 'gtkrc-2.0'
}

install_git() {
  [[ -f $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/.gitconfig.old && exi 'gitconfig'
  ln -s $(pwd)/gitconfig $HOME/.gitconfig && suc 'gitconfig'
}

install_redshift() {
  [[ -f $HOME/.config/redshift.conf ]] && mv $HOME/.config/redshift.conf $HOME/.config/redshift.old && exi 'redshift'
  ln -s $(pwd)/.config/redshift.conf $HOME/.config/redshift.conf && suc 'redshift'
}

install_compton() {
  [[ -f $HOME/.config/compton.conf ]] && mv $HOME/.config/compton.conf $HOME/.config/compton.conf.old && exi 'compton'
  ln -s $(pwd)/config/compton.conf $HOME/.config/compton.conf && suc 'compton'
}

install_bin() {
  [[ -d $HOME/.bin ]] && mv $HOME/.bin $HOME/.bin.old && exi 'bin'
  ln -s $(pwd)/bin/ $HOME/.bin && suc 'scripts'/
}

install_termite() {
  if [ -d $HOME/.config/termite ]; then
    mv $HOME/.config/termite/config $HOME/.config/termite/config.old && exi 'termite'
  else
    mkdir $HOME/.config/termite
  fi
  ln -s $(pwd)/config/termite/config $HOME/.config/termite/config && suc 'termite'
}

install_conky() {
  if [ -d $HOME/.config/conky ]; then
    mv $HOME/.config/conky/conky.conf $HOME/.config/conky/conky.conf.old && exi 'conky'
  else
    mkdir $HOME/.config/conky
  fi
  ln -s $(pwd)/config/conky.conf $HOME/.config/conky/conky.conf && suc 'conky'
}

install_zathura() {
  if [ -d $HOME/.config/zathura/ ]; then
    mv $HOME/.config/zathura/zathurarc $HOME/.config/zathura/zathurarc.old && exi 'zathurarc'
  else
    mkdir $HOME/.config/zathura
  fi
    ln -s $(pwd)/config/zathura/zathurarc $HOME/.config/zathura/zathurarc && suc 'zathurarc'
}

install_mpd() {
  if [ -d $HOME/.config/mpd ]; then
    mv $HOME/.config/mpd/mpd.conf $HOME/.config/mpd/mpd.conf.old && exi 'mpd'
  else
    mkdir $HOME/.config/mpd
  fi
  ln -s $(pwd)/config/mpd/mpd.conf $HOME/.config/mpd/mpd.conf && suc 'mpd'
}

install_gtk3() {
  [[ -d $HOME/.config/gtk-3.0 ]] && mv $HOME/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini.old && exi 'gtk-3.0'
  ln -s $(pwd)/config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini && suc 'gtk-3.0'
}


if [ "$1" == "-s" ]; then
  install_bin
  install_vim
  install_git
  install_zsh
else
  install_xinitrc
  install_vim
  install_xresources
  install_zsh
  install_gtk2
  install_git
  install_redshift
  install_compton
  install_bin
  install_termite
  install_conky
  install_zathura
  install_mpd
  install_gtk3
fi
