```
   ___           __      _          __       ____   ___                 ___  ___  __     
  / _ | ________/ /     (_)__  ___ / /____ _/ / /  / _/__  ____   ___  / _ \/ _ \/ /  ___
 / __ |/ __/ __/ _ \   / / _ \(_-</ __/ _ `/ / /  / _/ _ \/ __/  / _ \/ // / // / _ \(_-<
/_/ |_/_/  \__/_//_/  /_/_//_/___/\__/\_,_/_/_/  /_/ \___/_/    /_//_/\___/\___/_.__/___/
```
The following process was gathered via experimentation and was done for a personal setup, with US keyboard layout, EN-US language and a UEFI system with [dualboot](https://wiki.archlinux.org/index.php/Dual_boot_with_Windows#UEFI_systems) windows.
This process is proceeded by a complete windows installations is done and working.

- This installation setup follows the Arch installation [guide](https://wiki.archlinux.org/index.php/Installation_guide) as the time of writing.

- [Download](https://www.archlinux.org/download/) Arch and check the integrity of the checksum.

- [USB ISO creation](USB-ISO.md) for launching the installation process.



### UEFI
To check if `UEFI` is enabled run: 
```
# ls /sys/firmware/efi/efivars
```

If the directory is non existent probably it's running on `BIOS` mode.

### Internet connection
While the original guide states different ways, if not already running, when intending to use wireless, just run:
```
# wifi-menu
```
And connect to your wireless device.

To verify if working, the following commands should return correctly:
```
# ping archlinux.org
# ping 8.8.8.8
```

### Clock
Ensure system clock is set correctly for your timezone
```
# timedatectl set-ntp true
# timedatectl set-timezone <Zone/City>
# timedatectl status
```

### Partition
When setting a dual boot installation, you can use windows partition tool to create the needed linux partitions, in addition to windows existent ones.

Windows will generate at least four partitions essential for a dual boot working setup

| Partition  | Location | Size       | File system |
| ---------- |:--------:|:----------:|:-----------:|
| Windows Recovery   | nvme1     | 500 MB     | ntfs        |
| EFI        | nvme2     | 100 MB     | vfat        |
| Reserved   | nvme3     | 15 MB      | ?           |
| Windows 10 | nvme4     | 95 GB      | ntfs        |

**These partitions are essential**

To create the new linux partitions it's possible to use during the installation `fdisk` or `gparted`.

The necessary partitions are `root(/)` and `efi(/boot/efi)`.
Optional are `swap` and `/home`. Swap can be done through a swapfile and not a partition.

This is the final look for this dual boot with windows. The first four partitions where already created via windows and are essential.

The partition 5 will be `root(/)`, 6 will be used for `swap` and 2 will be reused from windows in a non destructive way to bootload linux. 

```
nvme        500G  disk 
├─nvme1 1   500M  part
├─nvme2 2   100M  part
├─nvme3 3    15M  part
├─nvme4 4    95G  part
├─nvme5 5   400G  part
└─nvme6 6     4G  part
```

### Formatting
Identify the partitions to format, in the above example, 5 is `root(/)` and 5 is `swap`.

```
# mkfs.ext4 /dev/nvme5
# mkswap /dev/nvme6
# swapon /dev/nvme6

```

### Mounting
Mount the live filesystem to the root partition:
```
# mount /dev/nvme5 /mnt
```

Next mount the `boot/efi` partition:
```
# mkdir /mnt/boot/efi
# mount /dev/nvme2 /mnt/boot/efi
```

Sometimes this can fail, if so do this after logging as root in the new system, but this info needs to be in the `fstab` file.

Some documentation states `/mnt/efi` instead of `mnt/boot/efi`.

### Mirrors
Edit `/etc/pacman.d/mirrorlist` removing far away mirrors, preferably leave only country mirrors.

Or use [Reflector](https://wiki.archlinux.org/index.php/Reflector) to sort them.

### Essential packages
Run `pacstrap` to install packaged into the new installation
```
# pacstrap /mnt base base-devel linux linux-firmware 
```

It is possible to also install other utility tools like wireless
```
# pacstrap /mnt iw wpa_supplicant wireless_tools networkmanager dialog
```

Or an editor
```
# pacstrap /mnt nano
```

This can also be done after logging into the new installation as root

### Setup 
Generate the file system table [fstab](https://wiki.archlinux.org/index.php/Fstab)

```
# genfstab -U /mnt >> /mnt/etc/fstab
```

Then check `/mnt/etc/fstab` to ensure it mounted the correct partitions. 

```
/etc/fstab

# <device>                                <dir> <type> <options> <dump> <fsck>
UUID=CBB6-24F2                            /boot vfat   defaults  0      2
UUID=0a3407de-014b-458b-b5c1-848e92a327a3 /     ext4   noatime   0      1
UUID=f9fe0b69-a280-415d-a03a-a32752370dee none  swap   defaults  0      0
```

Change root into the new system 
```
# arch-chroot /mnt
```

Set timezone, where <Region/City> is something like <Europe/London>
```
# ln -sf /usr/share/zoneinfo/<Region/City> /etc/localtime
```

Run `hwclock` using `UTC`, this will later clash with windows, some changes are needed, either in windows or linux.
```
# hwclock --systohc
```

Edit `/etc/locale.gen`, uncomment `en_US.UTF-8 UTF-8` (for US), then generate a new locale conf, and update it.

```
# nano /etc/locale.gen
...
# locale-gen
...
# echo LANG=en_US.UTF-8 > /etc/locale.conf
```

Might be necessary to edit `/etc/vconsole.conf` for different keyboards.

Network configuration, create hostname file and add host name where `myhostname` is your chosen host name.
```
# nano /etc/hostname
...
myhostname
```

Edit `/etc/hosts` as:
```
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

Usually not necessary to create a new `initramfs` because it's run when installing `kernel`
```
# mkinitcpio -P
```

Set root password
```
passwd
```

### Bootloader
There is some choice in bootloaders, `rEFInd` and `grub` are some of the more common ones. In this particular setup we go with `grub` and `intel-ucode`, change the microcode for the adequate version on your machine.

```
# pacman -S grub efibootmgr
# pacman -S intel-ucode dosfstools mtools os-prober 
```

Install `grub` into `/boot`
```
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --recheck
```

To generate or the config file
```
# grub-mkconfig -o /boot/grub/grub.cfg
```

### Network
Enable NetworkManager service, this will enable wireless at start.
```
sudo systemctl enable NetworkManager.service
```

To connect to wireless run `nmtui` and connect to your wireless network.

### Users
Add a new user and give it group rights, `wheel` is the most important for managing the system, it is a system setting to provide special system privileges.
```
# useradd -mG lp,network,power,sys,wheel <username>
# passwd <username>
```

Edit the `sudoers` file 
```
# export EDITOR=nano && visudo
```
And uncomment the `wheel` line below.
```
## Uncomment to allow members of group wheel to execute any command
%wheel ALL=(ALL) ALL
```

## Dual boot time settings
Dual boot always has some troubles with the time settings, by default WinOS and Linux have different settings regarding time, on WinOS the time by default is Local Time, this can be changed, on the BIOS/UEFI or even in the WinOS registry.
However in easier to make Linux use Local time instead of Universal Time.

for this run `timedatectl`, to query and change system clock setting:
`timedatectl set-local-rtc 1`

And to make Linux synchronized:
`timedatectl set-ntp true`

### X Server
X or [Xorg](https://wiki.archlinux.org/index.php/Xorg) is display server necessary for running GUI in linux.

```
# sudo pacman -S xorg-server xorg-init xorg-xrandr
```
Next find the necessary driver
```
# lspci | grep -e VGA -e 3D
```
And according to the answer install the necessary drivers
```
# pacman -S nvidia nvidia-prime
```
* [Nvidia](GAMING.md#nvidia)

### Install WM 

```
# pacman -S i3-wm i3lock i3status 
```
```
# pacman -S bspwm sxhkd
```

### Bluetooth

* [Bluetooth](BLUETOOTH.md#Installation)

### Audio

* [Audio](AUDIO.md#Installation)

### Firewall

```
# pacman -S nftables firewalld
```
[Firewalld](https://wiki.archlinux.org/index.php/Firewalld) is a daemon and frontend for `nftables`

### SSH

```
# pacman -S openssh
```

To generate a new SSH key
```
# ssh-keygen -t rsa -b 4096 -C "you@email.com"
...
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa
```


### Exit
Reboot, remove USB and get back to `Arch`
```
# exit      # exit root
# umount -R /mnt
# reboot
```