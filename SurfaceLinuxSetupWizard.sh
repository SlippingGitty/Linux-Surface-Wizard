#!/usr/bin/env bash
# Linux-Surface-Wizard is licensed under MIT license, see https://github.com/SlippingGitty/Linux-Surface-Wizard/blob/main/LICENSE for more info                                                                          
# _|      _|                      _|  _|  _|            _|      _|_|            
# _|      _|    _|_|_|  _|_|_|        _|  _|    _|_|_|        _|      _|    _|  
# _|      _|  _|    _|  _|    _|  _|  _|  _|  _|    _|  _|  _|_|_|_|  _|    _|  
#   _|  _|    _|    _|  _|    _|  _|  _|  _|  _|    _|  _|    _|      _|    _|  
#     _|        _|_|_|  _|    _|  _|  _|  _|    _|_|_|  _|    _|        _|_|_|  
#                                                                           _|  
#                                                                       _|_|                                               
#            VERSION 2021.11.04.01

#INITIAL INFO PROMPT
dialog  --title "Vanillaify" --infobox "Welcome. \n\nThis script will help you install vanilla GNOME, remove snapd, and give you other various QOL options.  \n\nIf you would like to help with this project, please consider contributing! Be sure to report any issues on SlippingGitty/Vanillaify" 10 70;sleep 5 
dialog  --title "⚠ CAREFUL ⚠" --infobox "WARNING. \n\nIf you have no idea what the following options are, chances are you should not be messing with them. \n\nPlease close this ASAP and read the Github page for more information." 10 70;sleep 5 


#DIALOG/NCURSES
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Vanillaify Toolbox 🔧"
TITLE="▼ Installer ▼"
MENU="Select an option:"

while [ "$CHOICE -ne 4" ]; do
    CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

#OPTIONS NAMES
OPTIONS=(1  "Add GNOME 40 PPA && Install"
         2  "Install ALL GNOME packages"
         3  "Switch to Adwaita theme"
         4  "Download GNOME 40 wallpapers"
         5  "Install QoL packages"
         6  "Remove Ubuntu logo from GDM"
         7  "Remove all of snapd"
         8  "Finish ☑")

#OPTIONS IN EXECUTION
clear
    case $CHOICE in
            1) 
                su -c "add-apt-repository ppa:shemgp/gnome-40 && apt-get update && apt-get install mutter=40.0-0shemgpubuntu6 -y && apt-get install gnome-shell=40.0-0shemgpubuntu3 -y && apt-get install gnome-session -y && apt-get install fonts-cantarell && apt-get upgrade -y
                echo Gnome 40 installed"
                sleep 5
            # Adds GNOME 40 repo and installs GNOME 40 and fonts
                ;;
            2)
                su -c "apt install gnome"
                echo the GNOME suite of applications are now installed
                sleep 5
            # Install ALL GNOME packages such as games, weather, media players, etc.
                ;;
            3)
                su -c "apt-get install adwaita-icon-theme-full" 
                gsettings set org.gnome.desktop.interface gtk-theme Adwaita | gsettings set org.gnome.desktop.interface icon-theme Adwaita
                echo Switched to Adwaita theme 
                sleep 3
            # Installs Switches theme to Adwaita
                ;;
            4)
                cd Pictures/
                git clone https://gitlab.gnome.org/GNOME/gnome-backgrounds.git
                cd
            # Downloads all of the latest GNOME wallpapers into the Pictures directory
                ;;
            5)
                su -c "apt-get install chrome-gnome-shell gnome-tweaks gnome-software"
                echo chrome-gnome-shell, tweaks, and the GNOME Software package manager is now installed
                sleep 3
            # Quallity of life GNOME things
                ;;
            6)
                cd /usr/share/plymouth/
                su -c "mv ubuntu-logo.png ubuntu-logo.png.bak"
                cd
                echo Ubuntu logo has been removed from GDM
                sleep 3
             # Removes the Ubuntu logo from GDM
                ;;
            7)
                su -c "snap remove snap-store | snap remove gtk-common-themes | snap remove gnome-3-34-1804 | snap remove core18 | snap remove snapd | umount /var/snap | apt purge snapd | rm -rf ~/snap | rm -rf /snap && rm -rf /var/snap | rm -rf /var/lib/snapd | apt-mark hold snapd"
                echo The bulk of snapd is removed
                sleep 5 
            # Completely removes snapd and installed snap packages
                ;;
            8)
                exit
            # Break
                ;;
    esac
done
