# Battery

Battery life is always finicky. According to recent standards to extend the battery life, it's advised to minimize charge cycles, this when plugged in to AC becomes important.

### TLP
TLP is the tool to get advanced power management in linux, with a significant level of simplicity.
```
sudo pacman -S tlp acpi_call tp_smapi
```

Enable  and start the service
```
#systemctl enable tlp.service
#systemctl start tlp.service
```

More settings can be found at `/etc/default/tlp`, modify according to [tlp](https://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html) documentation.

Models like Thinkpad can have special configurations to manage charging thresholds and provide better battery life expectancy. For this models is necessary to install `tp-smapi-dkms` or `acpi-call-dkms`, install this according to documentation, smapi for older models, acpi to more recent ones.

This allows to manager thresholds for the batteries and recalibration.[todo]

To know what version is adequate for your model run `sudo tlp-stat -b` and it will suggest the adequate version to install along with charge cycles, capacity and thresholds, on the bottom search for one of the following *Recommendations*:

```
Install tp-smapi kernel modules for ThinkPad battery thresholds and recalibration
Install acpi_call kernel module for ThinkPad battery thresholds and recalibration 
Install acpi_call kernel module for ThinkPad battery recalibration
```

Starting with Kernel 4.17 there comes a native Kernel API called `natacpi`, `sudo tlp-stat -b` should show the message `natacpi = active (data, thresholds)`, or after merge in Kernel 5.0 `natacpi = active (data, thresholds, discharge)`.
For more information on [Thinkpad tlp](https://linrunner.de/en/tlp/docs/tlp-faq.html#kernmod) take a look at documentation.

To install `acpi_call` it's necessary to check first ther kernel version in use, to do this run `uname -a`, with this information run `sudo pacman -S acpi_call` and choose the correct version for your kernel.
It's then necessary to enable tlp services, for this run `systemctl enable tlp.service` and `systemctl enable tlp-sleep.service`.

To update thresholds edit `/etc/defaults/tlp`, remove `#` and change values according to your desire. As an example:

```
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=80
START_CHARGE_THRESH_BAT1=75
STOP_CHARGE_THRESH_BAT1=80
```

This will change the way battery charges, it only starts charging when values are under 75, and will stop after 80, this sould provide better battery life overall even if makes your usage somewhat shorter.

Is also possible to override the processor settings for Thinkoad modes and undervolt it, this will grant greater battery life.
This however needs some careful implementation, once more take a look at documentation.[todo]

There is also `tlp-rdw` to manage and control wireless and bluetooth specs.

Battery levels can be added to device bars using `i3status` on the `i3bar` or through polybar. 
