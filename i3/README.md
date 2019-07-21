# i3

Manjro i3 comes with palemoon as default browser. 
Install firefox. `sudo pacman -S firefox` or through software manager

# Manjaro i3 settings
`$mod+Ctrl+b exec terminal -e 'bmenu'`

This will bring a text ui with options, install a new kernel, or two, just in case it's needed for recovery options.

Check wich grafics are wanted, if Nvidia optimus then use non-free graphics.

Mi3 File Manager is ranger, can be used on the command line. Neat!

Also gaps is enabled by default.

Install rofi, a better dmenu: `sudo pacman -S rofi`.
After installing edit the .i3/config file, comment the line about dmenu and add:
`bindsym $mod+d exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3`
Then latter it's possible to configure the look of it.

For a text editor with window, install gedit.
