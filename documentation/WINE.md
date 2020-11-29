# Wine
[wine](https://www.winehq.org/) is an compatibility tool to run windows applications on linux.

To install first enable [multilib](GAMING.md#multilib)

```
# pacman -S wine winetricks
```

To uninstall an application run
```
# wine uninstaller
```

## Adobe drm
Adobe drm locks `pdf` and `epub` books under a `.acsm` file. To extract them is necessary to run adobe digital editions, but there is no installer for linux.

Before installation first download the windows installation file. Some other packages are necessary
```
# pacman -S lib32-gnutls samba
# winetricks corefonts dotnet40
# wine <Location/ADE_installer.exe>
```

Add a downloaded `.acsm` book and authorize the machine with adobe ID. 


