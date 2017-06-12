[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap -layout us,ua -option grp:shifts_toggle
exec awesome
