# GNOME

Configs for gnome

## HiDpi Gtk
When using a HiDpi setup, might be necessary to scale to an external monitor, that can be made via `xranr`, however that has an impact over the font rendering and size apps, one way to do this is to add a gtk scale setting to `.profile` and then adjust via `xrandr`.

`export GDK_SCALE=2` increases applications size, in this case doubles, it only integer numbers.

`export GDK_DPI_SCALE` diminish font size on application that use gnome, like `gedit`.

To make the bar more fitting it's necessary to change css configurations. 

## Gtk themes
Themes modified or download got on `.themes` package. From there they should appear in the tweaking tool.

## Gnome bar
When using a hidpi config, or anyother, the ususal gnome bar is to big.

Add the `gtk.css` file to `/.config/gtk-3.0` with the following details to specify an appropriate size for the bar.

```
.window-frame {
  box-shadow: none;
  margin: 0;
}
.titlebar, headerbar {
    min-height: 0px;
    padding: 0px;
    margin: 0px;
}
headerbar entry,
headerbar spinbutton,
headerbar button,
headerbar separator {
    min-height: 0px;
    padding: 0px;
    margin: 1px;
}
```

### Other versions
There are some alternatives for configure, mainly for different versions of gnome.

[Gnome 3](Gnome 3 - based on https://blog.samalik.com/make-your-gnome-title-bars-smaller/)
```
.header-bar.default-decoration {
    padding-top: 3px;
    padding-bottom: 3px;
    font-size: 0.8em;
}
.header-bar.default-decoration .button.titlebutton {
    padding: 0px;
}
```

[Gnome 3.20+](Gnome 3.20+ - based on https://blog.samalik.com/make-your-gnome-title-bar-smaller-fedora-24-update/)
```
window.ssd headerbar.titlebar {
    padding-top: 4px;
    padding-bottom: 4px;
    min-height: 0;
}
window.ssd headerbar.titlebar button.titlebutton {
    padding: 0px;
    min-height: 0;
    min-width: 0;
}
```
