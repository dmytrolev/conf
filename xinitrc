[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap -layout us,ua -option grp:ctrl_shift_toggle
exec awesome
