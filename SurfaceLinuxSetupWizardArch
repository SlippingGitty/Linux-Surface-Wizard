#!/usr/bin/env bash
# Linux-Surface-Wizard is licensed under MIT license, see https://github.com/SlippingGitty/Linux-Surface-Wizard/blob/main/LICENSE for more info
#    __  _  _ ___ ___ __   ______   _   _ __  _ _  ___   __   __  ___ _____ _  _ ___   _   _  _ ___  __  ___ __   
#   /' _/| || | _ \ __/  \ / _/ __| | | | |  \| | || \ \_/ / /' _/| __|_   _| || | _,\ | | | || |_  |/  \| _ \ _\  
#   `._`.| \/ | v / _| /\ | \_| _|  | |_| | | ' | \/ |> , <  `._`.| _|  | | | \/ | v_/ | 'V' || |/ /| /\ | v / v | 
#   |___/ \__/|_|_\_||_||_|\__/___| |___|_|_|\__|\__//_/ \_\ |___/|___| |_|  \__/|_|   !_/ \_!|_|___|_||_|_|_\__/  
#
#                                           
#            VERSION 2021.05.03.02

#INITIAL INFO PROMPT
if dialog  --title "Linux-Surface Setup Wizard" --infobox "Welcome. \n\nIf this is your first time running this script, please select option 1 before attempting to do anything else. \n\nAfterwards, select a function by typing the number that co-relates with the specific action you want to do." 10 70;
then
    sleep 5
else
    echo "You may need to install dialog with 'pacman -S dialog'. Do this, then rerun this script"
    sleep 2
    exit
fi 
#DIALOG/NCURSES
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Apt Linux-Surface Setup Wizard"
TITLE="Installer"
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
OPTIONS=(1  "Import keys and add repo"
         2  "Install kernel modules"
         3  "Install touchscreen support"
         4  "Enable secure boot"
         5  "Show GRUB menu"
         6  "Update GRUB and Finish")

#OPTIONS IN EXECUTION
clear
    case $CHOICE in
            1) 
               su -c 'curl -s https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc \
    | sudo pacman-key --add - && pacman-key --finger 56C464BAAC421453 && pacman-key --lsign-key 56C464BAAC421453 && cp /etc/pacman.conf /etc/pacman.conf.save && echo "[linux-surface]" >> /etc/pacman.conf && echo "Server = https://pkg.surfacelinux.com/arch/" >> /etc/pacman.conf && pacman -Syu'
            # Signs the repos needed to install the surface-linux packages
                ;;
            2)
                su -c "pacman -S linux-surface linux-surface-headers"
            # Installs the surface-linux modules and headers
                ;;
            3)
                su -c "pacman -S iptsd && systemctl enable iptsd"
            # Installs and enables touchscreen support
                ;;
            4)
                su -c "pacman -S linux-surface-secureboot-mok"
            # Installs and enables secure boot
                ;;
            5)
                dialog  --title "Surface-Linux Setup Wizard" --infobox "This is going to remove GRUB_TIME=0 from your /etc/default/grub file. \n\nGRUB is a bootloader, and that's like, very important! \n\nYou can manually add this back yourself if you wish to hide it again." 10 70;sleep 5
                clear
                su -c "cp /etc/default/grub /etc/default/grub.bak && sed -i 's/\<GRUB_TIMEOUT=0\>//g' /etc/default/grub && grub-mkconfig -o /boot/grub/grub.cfg"
             # Removes the timeout for GRUB and shows the menu
                ;;
            6)
                su -c "grub-mkconfig -o /boot/grub/grub.cfg"
                exit
                ;;
    esac
done
