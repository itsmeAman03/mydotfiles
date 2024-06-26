# mydotfiles
This repositry contain my all dotfiles of ricing in Endeavour OS based on Arch Linux .
These are the modules you need to download to reconfig dot files:- 
   - feh #background  wallpaper
   - light #brightness
   - i3 i3status 
   - polybar #bar on the top
   - jetbrains nerd font 
   - picom #this is fork of compton which is used to adjust transparency of windows
   - alacritty #terminal  
   - rofi #menu manager
   - fzf (Fuzzy Finder)
   - kitty-terminal
   - zsh ( zsh for terminal )
   - oh-my-zsh (zsh config and theming)
   - powerlevel10k

## To activate light we need to do following steps:- 
1. Install "light" module
```bash
    yay -S light
```
2. Run the following command:
```bash
    sudo chmod +s /usr/bin/light
```
3. add these lines in i3 config file 
```bash
    bindsym XF86MonBrightnessUp exec --no-startup-id light -A 5 # increase screen brightness
    bindsym XF86MonBrightnessDown exec --no-startup-id light -U 5 # decrease screen brightness
```
## To polybar to Launch.sh file work as executable 
1. create launch.sh #included in repo 
2. execute this cmd :-  
```bash
    chmod +x $HOME/.config/polybar/launch.sh
```
3. add this to i3 config :- 
```bash
    exec_always --no-startup-id $HOME/.config/polybar/launch.sh
```
## Things to be noted:
All these folder should be in $HOME/.config/
Whenenve you edit your .zshrc file You need to reload it everytime 
    ```bash
        source $HOME/.zshrc
    ```
You have to move .zshrc file to $HOME directory
Custom folder should be in $ZSH_CUSTOM (i.e. $HOME/.oh-my-zsh/) directory 

After the nvim config you need to install all plugins
  - Go in Visual mode 
  - Press Shift+: 
  - Type Lazy anf then Enter
