# Mice

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