#!/bin/sh

# xsetroot -cursor_name left_ptr &
#doas sndioctl input.level=0.75 &
doas sndioctl output.level=0.75 &
xsetroot -name " " &
xrdb -merge $HOME/.Xresources
setxkbmap -model pc105 -layout us,gr -option grp:alt_space_toggle &

# xrandr --output DP-1 --primary --mode 2560x1440 --rate 165 --pos 0x0 --rotate normal --output DP-2 --off --output DP-3 --off --output HDMI-1 --off
mpd &

### START COMPOSITOR ###
picom -b --experimental-backends &

### START NOTIFICATIONS ###
dunst &
#unclutter &
### SETTING WALLPAPER ###
feh --bg-fill ~/Pictures/Wallpapers/openbsd_catppuccin.png &
xsetroot -solid black &

while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
  do
	sleep 1
  done &
exec dwm
