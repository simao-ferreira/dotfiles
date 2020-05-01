# Terminal emulator

The Manjaro i3 configuration installs uterm, uxterm and urxvt by default.
Arch does not have a terminal emulator by default.

## Urxvt

[urxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode) aka rxvt-unicode is a very customizable terminal emulator.

By default the original setting look old and completely unworkable, but urxvt configurations are loaded from `.Xresources`, there is possible to configure from color pattern, font, behavior and even extensions.

Relevant settings like colors
```
*.foreground:   #D8DEE9
*.background:   #2E3440
*.cursorColor:  #D8DEE9

*.color0: #3B4252
*.color1: #BF616A
*.color2: #A3BE8C
*.color3: #EBCB8B
*.color4: #81A1C1
*.color5: #B48EAD
*.color6: #88C0D0
*.color7: #E5E9F0
*.color8: #4C566A
*.color9: #BF616A
*.color10: #A3BE8C
*.color11: #EBCB8B
*.color12: #81A1C1
*.color13: #B48EAD
*.color14: #8FBCBB
*.color15: #ECEFF4

```

font
```
URxvt.font:                        10x20,xft:TerminessTTFNerdFontMono
```
Or
```
URxvt.font:                       xft:Iosevka Nerd Font Mono:size=10
```

For enabling transparency
```
URxvt*depth: 32
```

To enable usual terminal behavior for copy and paste
```
URxvt.iso14755:	false
URxvt.keysym.Shift-Control-C:	eval:selection_to_clipboard
URxvt.keysym.Shift-Control-V:	eval:paste_clipboard
```

To remove the presence of scroll bar
```
URxvt*mouseWheelScrollPage:	false
URxvt*scrollBar:	false
```

Remove excess spacing between letters
```
URxvt.letterSpace:	-3
```

# Shell

By default Manjaro i3 uses `bash` shell.
During installation Arch uses `zsh`, after the user needs to install `zsh` if it wants to keep using it.


## Zsh
To install `zsh` run `sudo pacman -S zsh` and `sudo pacman -S zsh-completions`.

Running `zsh` will run zsh first time configuration, if doesn't run `zsh-newuser-install`, from this it's possible to configure history and completion. The new configuration file is found as `.zshrc`.

Note: Make sure your terminal's size is at least 72×15 otherwise `zsh-newuser-install` will not run.


### Oh-my-zsh

Optionally there is [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) to manage the zsh configuration, to add it run:
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
Adding to to `oh-my-zsh` there are several plugins like git and `agnoster` theme. For themes it can be necessary to install `powerline fonts`. This is possible through `AUR` installing `nerd-fonts-complete`. Change the `ZSH_THEME="agnoster"` or other to get "eye-candy" visuals.

Important setting to specify
```
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# Completion system dump
ZSH_COMPDUMP="$HOME/.config"
CASE_SENSITIVE="false" HIST_STAMPS="dd.mm.yyyy"
# Command history file location
HISTFILE="$HOME/.cache/zsh/histfile"
```

#### Powerlevel10k

[p10k](https://github.com/romkatv/powerlevel10k) is a `zsh` theme extremely configurable