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

compton &

feh --bg-scale $HOME/Imagens/wp/1493631498078.jpg

sleep 5

[[ -z $(pgrep -xU $UID mpdas) ]] && mpdas &

xautolock -time 10 -locker lock &

xrdb $HOME/.Xresources
($HOME/.bin/dwmstatus | while read STAT; do xsetroot -name "$STAT"; done) &

# Para o SCIM
#export XMODIFIERS=@im=SCIM
#export GTK_IM_MODULE="scim"
#export QT_IM_MODULE="scim"
#scim -d

redshift &
