# Create a USB drive installation  

To create a live USB using the terminal check the drive name.

This can be done though `fdisk -l` where the expected outcome should be something like:
```
Disk /dev/sdb: 3.74 GiB, 3997138944 bytes, 7806912 sectors
Disk model: <model>
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: <identifier>

Device     Boot Start     End Sectors  Size Id Type
/dev/sdb1  *        0 1329151 1329152  649M  0 Empty
/dev/sdb2         164  131235  131072   64M ef EFI (FAT-12/16/32)
```

Or using `lsblk`, with a example output:
```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sdb           8:16   1   3.7G  0 disk 
├─sdb1        8:17   1   649M  0 part 
└─sdb2        8:18   1    64M  0 part 
```

Usually something like */dev/sd**X***, above */dev/sdb*.


Replace [path/to/download] for the download filename and [device] for the drive name */dev/sd**X*** (The drive name, is *sdb*, don't append the number!) and run:

```
sudo dd if=[path/to/download].iso of=/dev/[device]  bs=4M status=progress
```

## Tips:

Just make sure your flash is not formatted as `exFat` or `ntfs`, it was not possible to recognize them in all of my attempts.


If in `UEFI` the drive does not load after the `dd` process, just try repeating the `dd` process above some more times, for some reason does not work every time.


