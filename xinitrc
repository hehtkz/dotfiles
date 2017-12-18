#!/bin/bash
# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#pkill conky
#[[ -z $(pgrep -xU $UID conky) ]] &
#(conky | while read STAT; do xsetroot -name "$STAT"; done) &

[ ! -s ~/.config/mpd/pid ] && mpd &
export PATH=$HOME/.bin:$PATH
export QT_STYLE_OVERRIDE=gtk2
export BROWSER=chromium
export STEAM_RUNTIME=0
export GTK_PATH=/usr/lib/gtk-3.0:/usr/lib/gtk-2.0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERMINAL=/usr/bin/termite
export _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on"

compton &

unclutter &

feh --bg-scale $HOME/Imagens/wp/$(ls $HOME/Imagens/wp | shuf -n 1)

sleep 5

[[ -z $(pgrep -xU $UID mpdas) ]] && mpdas &

xautolock -time 10 -locker lock &

xrdb $HOME/.Xresources
($HOME/.bin/dwmstatus | while read STAT; do xsetroot -name "$STAT"; done) &
xmodmap -e 'keysym Super_L = Escape'

# Para o SCIM
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
#scim -d
fcitx
redshift &
