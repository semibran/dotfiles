#!/bin/sh

# merge user config
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
[ -f $userresources ] && xrdb -merge $userresources
[ -f $usermodmap ] && xmodmap $usermodmap

# load xinit directory
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# load monitors
internal=eDP1
external=DP1

if xrandr | grep "$external disconnected"; then
  xrandr --output "$internal" --auto --output "$external" --off
else
  xrandr --output "$internal" --auto --output "$external" --mode 1280x1024 --right-of "$internal"
fi

feh --bg-fill ~/media/wallpapers/1280x1024/03.jpg \
    --bg-fill ~/media/wallpapers/1366x768/00.jpg \
    --no-fehbg \
    --randomize

# start programs
pgrep redshift &> /dev/null || redshift &> /dev/null &
~/.config/lemonbar/lemonbar.sh &
sxhkd &
urxvt &
exec bspwm
