# mydotfiles
This repositry contain my all dotfiles of ricing in Endeavour OS based on Arch Linux .
These are the modules you need to download to reconfig dot files 
1. feh #background  wallpaper
2. light #brightness
3. i3 i3status 
4. polybar #bar on the top
5. jetbrains nerd font 
6. picom #this is fork of compton which is used to adjust transparency of windows
7. alacritty #terminal  
8. rofi #menu manager 

TO activate light we need to do following steps 
1. install "light" module
2. sudo chmod +s /usr/bin/light
3. add these lines in i3 config file 
bindsym XF86MonBrightnessUp exec --no-startup-id light -A 1 # increase screen brightness
bindsym XF86MonBrightnessDown exec --no-startup-id light -U 1 # decrease screen brightness

To polybar to Launch.sh file work as executable 
1. create launch.sh #included in repo 
2. execute this cmd :-  chmod +x $HOME/.config/polybar/launch.sh
3. add this to i3 config :- 
exec_always --no-startup-id $HOME/.config/polybar/launch.sh
