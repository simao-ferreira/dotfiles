# Terminal emulator

The Manjaro i3 has uterm, uxterm and urxvt by default.
Arch does not have a terminal emulator by default.

## Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a GPU-accelerated terminal emulator.

Alacritty is extremely fast, it's configuration simple. Configurations go under `.config/alacritty/alacritty.yml`.

Example of relevant configurations
```
colors:
  primary:
    background: '0x2E3440'
    foreground: '0xD8DEE9'
  cursor:
    text: '0x2E3440'
    cursor: '0xD8DEE9'
  normal:
    black: '0x3B4252'
    red: '0xBF616A'
    green: '0xA3BE8C'
    yellow: '0xEBCB8B'
    blue: '0x81A1C1'
    magenta: '0xB48EAD'
    cyan: '0x88C0D0'
    white: '0xE5E9F0'
  bright:
    black: '0x4C566A'
    red: '0xBF616A'
    green: '0xA3BE8C'
    yellow: '0xEBCB8B'
    blue: '0x81A1C1'
    magenta: '0xB48EAD'
    cyan: '0x8FBCBB'
    white: '0xECEFF4'

font:
  normal:
    family: 'Iosevka Nerd Font'
    style: Regular
  size: 10.0
```

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

Font
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

#### Fonts
To test font look on urxvt terminal
```
printf '\e]710;%s\007' "xft:Terminus:pixelsize=12"
```

# Shell

By default Manjaro i3 uses `bash` shell.
During installation Arch uses `zsh`, after the user needs to install `zsh` if it wants to keep using it.

## Zsh
To install `zsh` run `sudo pacman -S zsh` and `sudo pacman -S zsh-completions`.

Running `zsh` will run zsh first time configuration, if not, run `zsh-newuser-install`, from this it's possible to set history and completion configs. The resulting configuration file is `.zshrc`.

Note: Make sure your terminal's size is at least 72×15 otherwise `zsh-newuser-install` might not run.

## Oh-my-zsh

[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) exists to manage the zsh configuration

```
 # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

There are several plugins to add like git, pyhton or themes. Themes might need other packages, like `powerline fonts` available via `AUR` installing `nerd-fonts-complete`. 

Change the `` or other to get "eye-candy" visuals.

Some important settings to specify
```
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_DATA_HOME="$HOME/.local/share"

# ZSH_COMPDUMP="$HOME/.config"
# CASE_SENSITIVE="false" HIST_STAMPS="dd.mm.yyyy"
# HISTFILE="$HOME/.cache/zsh/histfile"
# ZSH_THEME="agnoster"
```

## Powerlevel10k

[P10k](https://github.com/romkatv/powerlevel10k) is a extremely configurable `zsh` theme.