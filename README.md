# Linux-Surface Wizard

Requirements:
  * systemd
  * `dialog`
  * `bash`
  * `yay`(for Arch)
  * Password for the root user. This script uses `su -c` rather than `sudo`.

## Using:
* For Debian based distros: Run `bash <( curl -s https://raw.githubusercontent.com/SlippingGitty/Linux-Surface-Wizard/main/SurfaceLinuxSetupWizard.sh)` in a terminal.
* For Arch based distros: Run `bash <( curl -s https://raw.githubusercontent.com/SlippingGitty/Linux-Surface-Wizard/main/SurfaceLinuxSetupWizardArch.sh)` in a terminal.
* For Fedora based distros OTHER THAN FEDORA SILVERBLUE: Run `bash <( curl -s https://raw.githubusercontent.com/SlippingGitty/Linux-Surface-Wizard/main/SurfaceLinuxSetupWizardFedora.sh)` in a terminal.
# ![screenshot](https://files.catbox.moe/dlm761.png)

### What does this do, and why should I trust this with my fresh install?
In a nutshell, this puts a pretty face on the [linux-surface](https://github.com/linux-surface/linux-surface) setup instructions. If you feel unweary about this, you can check the scripts yourself, and cross examine it with the [linux-surface](https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup) setup guide. It's quite literally just spitting the instructed commands into a terminal.

# Trouble shooting:

### Check out the [Wiki!](https://github.com/SlippingGitty/Linux-Surface-Wizard/wiki)

### Why aren't the modules loading?
This may be because the wrong kernel is being loaded.

As a way to debug, in the setup wizard, there is an option show the GRUB menu.

This spits the command `sudo sed -i 's/\<GRUB_TIMEOUT=0\>//g' /etc/default/grub`, effectively removing `GRUB_TIMEOUT=0` from the /etc/default/grub file, allowing the GRUB menu to be visible. (It also makes a backup to /etc/default/grub.bak just in case. To restore it, simply run `cp /etc/default/grub.bak /etc/default/grub` as root.)

Some distros such as Ubuntu hide the GRUB menu by default, so you have to delete or comment out "GRUB_TIMEOUT=0" to "#GRUB_TIMEOUT=0" in order to unhide it.

From there, you can then select the boot entry from the GRUB menu and be on your way to using your computer like a normal person.

### Why isn't my touchscreen/pen/camera/etc working?

Please check [linux-surface/Feature Matrix](https://github.com/linux-surface/linux-surface/wiki/Supported-Devices-and-Features#feature-matrix).



### Where do I start?
1, 2, preferably 3, then optionally 4. If neccessary, 5, then finish with 6 and reboot to see if it worked.

### Hey! Something isn't working!
Submit an issue and we'll get to you as soon as possible.
___

Or you can do it manually! https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup
