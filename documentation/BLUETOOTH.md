# Bluetooth

## Installation
Install `bluez` package that provides bluetooth protocol stack.
```
sudo pacman -S bluez bluez-utils
```

After start and enable the service
```
# systemctl enable bluetooth.service
# systemctl start bluetooth.service
```

May be necessary to configure `/etc/bluetooth/main.conf`
```
[General]
DiscoverableTimeout = 0
Discoverable=true
[Policy]
AutoEnable=true
```
If it does not launch at start run
```
systemctl restart bluetooth.service
bluetoothctl
```

## Sony bluetooth headphones

To enable bluetooth headphones it is necessary to install also `pulseaudio-bluetooth` package.

Sometimes, for wireless audio devices it is necessary to connect twice for them to properly work.


## Logitech bluetooth mouse
The logitech mice mostly work out of the box via direct bluetooth connection (or USB dongle according to the forum), but some details like `DPI` control are not available to configure via hardware, most configs must be done via software. 

Configuration setup for logitech mice can be done by installing `AUR` package `logiops-git`, documentation found at [logiops](https://wiki.archlinux.org/index.php/Logitech_MX_Master).

Config file is located at `etc/logid.cfg`. The basic setup according can be fount on the `logiops` wiki, a basic setup example looks like:

```
devices: (
{
    name: "MX Master 3";
    smartshift:
    {
        on: true;
        threshold: 30;
    };
    hiresscroll:
    {
        hires: true;
        invert: false;
        target: false;
    };
    dpi: 2800;
}
);
```

To set it up as service `systemctl enable logid.service` or run `logid`.

To change file destination running `logid -c <destination>`. 

## Tips

For this configuration to work at start is also necessary to have bluetooth service initiated.

See [Bluetooth](WIP/ARCH-FOR-N00BS.md#Bluetooth) for setting bluetooth

Sometimes it is also necessary to drag the mouse or click a button for it to notice the connection.