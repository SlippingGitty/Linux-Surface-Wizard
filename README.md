# Linux-Surface Wizard for Debian-based Distros

Requirements: `dialog` `nano`

### What does this do?
Nothing you can't do yourself! I'm lazy and I don't like to do much work post-installation. This basically puts a pretty face on the [linux-surface](https://github.com/linux-surface/linux-surface) setup instructions.

### Why should I trust you with my fresh install?
Check the script yourself and cross examine it with the [linux-surface](https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup) setup guide. It's quite literally just spitting the instructed commands into a terminal.

# Trouble shooting:

### Why aren't the modules loading?
So in the setup wizard, there is an option to edit the GRUB preferences.

This spits the command `sudo nano /etc/default/grub` and allows you to make whatever changes you would like.

I have found that distros like Ubuntu *love* to keep GRUB from showing, so you have to comment out "GRUB_TIMEOUT=0" to "#GRUB_TIMEOUT=0" in order to unhide it.

From there, you can then select the kernel module and be on your way to using your computer like a normal person.
___

Or you can do it manually! https://github.com/linux-surface/linux-surface/wiki/Installation-and-Setup


##### Ones for Arch-based distros and Fedora are coming soon lol.
