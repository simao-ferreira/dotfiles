## BLUETOOTH MOUSE

The logitech mice work out of the box via direct Bluetooth connection, but some details like `DPI` are not available to configure via hardware, most configs must be done via software, which does not have company support. 

Configuration setup for logitech mice can be done by installing `AUR` package `logiops-git`, documentation found at [logiops](https://wiki.archlinux.org/index.php/Logitech_MX_Master).

Config file at `etc/logid.cfg` basic setup looks like:

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

To set it up as service `systemctl enable logid.service` or run `logid`. To change file destination running `logid -c <destination>`. 
