# Linux-Surface Wizard for Debian-based Distros that use systemd

Requirements: `dialog` and `bash`

## Using:
* Run `bash <( curl -s https://raw.githubusercontent.com/SlippingGitty/Linux-Surface-Wizard/main/SurfaceLinuxSetupWizard.sh )` in a terminal.
# ![screenshot](https://files.catbox.moe/dlm761.png)

### What does this do?
Nothing you can't do yourself! I'm lazy and I don't like to do much work post-installation. I took an older script I made, changed some commands, and called it a day. This basically puts a pretty face on the [linux-surface](https://github.com/linux-surface/linux-surface) setup instructions.

### Why should I trust you with my fresh install?
Check the script yourself and cross examine it with the [linux-surface](https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup) setup guide. It's quite literally just spitting the instructed commands into a terminal.

# Trouble shooting:

### Why aren't the modules loading?
So in the setup wizard, there is an option show the GRUB menu.

This spits the command `sudo sed -i 's/\<GRUB_TIMEOUT=0\>//g' /etc/default/grub`, effectively removing `GRUB_TIMEOUT=0` from the /etc/default/grub file, allowing the GRUB menu to be visible.

I have found that distros like Ubuntu *love* to keep GRUB from showing, so you have to delete or comment out "GRUB_TIMEOUT=0" to "#GRUB_TIMEOUT=0" in order to unhide it.

From there, you can then select the boot entry and be on your way to using your computer like a normal person.

### Where do I start?
1, 2, preferably 3, then optionally 4. If neccessary, 5, then finish with 6 and reboot to see if it worked.

### Hey! Something isn't working!
lol submit an issue and I'll get to you as soon as I can.
___

Or you can do it manually! https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup
