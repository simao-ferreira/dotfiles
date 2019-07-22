# i3

Manjro i3 comes with palemoon as default browser. 
Install firefox. `sudo pacman -S firefox` or through software manager

# Manjaro i3 settings
`$mod+Ctrl+b exec terminal -e 'bmenu'`

This will bring a text ui with options, install a new kernel, or two, just in case it's needed for recovery options.

Check wich grafics are wanted, if Nvidia optimus then use non-free graphics.

Mi3 File Manager is ranger, can be used on the command line. Neat!
Adding to Ranger there is also pcmanfm, a very well integrated File Manager.

Also gaps is enabled by default.

Install rofi, a better dmenu: `sudo pacman -S rofi`.
After installing edit the .i3/config file, comment the line about dmenu and add:
`bindsym $mod+d exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3`
Then latter it's possible to configure the look of it.

For a text editor with window, install gedit.

Install chromium, neofetch and gotop.

Sound not working from headphones.

Time not working, set:
`timedatectl set-local-rtc 1`
`timedatectl set-ntp true`

There is a installation of Viewnior, however, install feh, for opening images and setting wallpapers. 
For changing the wallpaper:
`exec_always --no-startup-id feh --bg-scale ~/.wallpapers/forest-nightscape.jpg`
But this will not work, one of the config instructions is to reset Nitrogen, the wallpaper loader by default, that does not recognise .jpg files. By commenting this line, the previous instruction will work.

Mi3 has lxappearence installed by deafult, with it is possible to load icons, mouse cursors, amongst others. Not fonts.

By default when changing the config file, the font input changes bar fonts, but not apps and terminal. For terminal URxvt comes as default, and with it the defaults can be changed at `.Xresources` however this terminal is more complex then usual to configure.
When setting new settings with lxappearence also can happen that some resources are irrecongizable for urxvt.
`https://wiki.archlinux.org/index.php/Rxvt-unicode` is a good resource for better understand fonts on URxvt.
To augment the size got to `/usr/share/fonts/misc/fonts.alias` and take a look at settings.
Edit the .Xresources accordingly, 10x20 is a good setting.


Night light does not come by default, install redshift, but also geoclue2 for it to work. Then geoclue needs configuration.
`/etc/geoclue/geoclue.conf

[redshift]
allowed=true
system=false
users=`

It's necessary to add in the config the settings for both redshift and geoclue
`exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent`
`exec --no-startup-id redshift-gtk`
