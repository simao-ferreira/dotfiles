## Firmware
Lenovo firmware update is released for Linux on [LVFS](https://fwupd.org/lvfs/search?value=Thinkpad+T480), for linux, on Arch repositories it's possible to install `fwupd`.

From arch wiki [fwupd](https://wiki.archlinux.org/index.php/Fwupd), to update firmware run 
```
# fwupdmgr get-devices
# fwupdmgr refresh
```
this will download the latest metadata from LVFS and list the updates available.

To update then run
```
# fwupdmgr get-updates
# fwupdmgr update
```

Warning: Updates from UEFI likely will discard the existent bootloader.
