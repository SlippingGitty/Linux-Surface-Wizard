#!/bin/bash
#         ____  ____________       __
#        / __ \/ ____/ ___/ |     / /
#       / /_/ / /    \__ \| | /| / / 
#      / ____/ /___ ___/ /| |/ |/ /  
#     /_/    \____//____/ |__/|__/   
#            VERSION 2021.02.11.01

#INITIAL INFO PROMPT
dialog  --title "Powercord Setup Wizard" --infobox "Welcome. \n\nIf this is your first time running this script, download the Powercord repo by selecting option 1 first.\n\nAfterwards, select a function by typing the number that co-relates with the specific action you want to do." 10 70;sleep 5 

#DIALOG/NCURSES
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Powercord Setup Wizard"
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
OPTIONS=(1 "Git Clone"
         2 "Update"
         3 "Install"
         4 "Uninstall"
         5 "Quit")

#OPTIONS IN EXECUTION
clear
    case $CHOICE in
            1)  
                cd        
                git clone https://github.com/powercord-org/powercord
            # Downloads Powercord files
                ;;
            2)
                cd powercord && git pull
                cd
            # Updates Powercord to latest version
                ;;
            3)
                cd powercord && sudo npm run plug
                cd
            # Injects Powercord into Canary
                ;;
            4)
                cd powercord && sudo npm run unplug
                cd
            # Uninjects
                ;;
            5)
            echo "User requested exit"
            exit
                ;;
    esac
done
