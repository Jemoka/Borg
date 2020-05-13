#!/bin/bash

# Hide the spinner

# First things first, say hi
clear
echo "Borg v0.0.1. We will assimilate you (with consent though)."
echo "=========================================================="
echo "Action Plan Today:
[ ] Configure coloured xterm
[ ] Install Brew
[ ] Install tmux, nvim, mosh
[ ] Install Python3 and anaconda
[ ] Configure all that we installed
"

echo "So, shall we do it?"
echo "Think long and hard here... Once we go there's no going back."
read -n 1 -p "(Y/N) " mainmenuinput
printf "\n"
if [[ $mainmenuinput != "y" ]]; then 
    exit 1
fi

echo "Alrighty, buckle up, because this is going to be fun!"
echo "Hiding cursor..."
tput civis
echo "Defining spinner..."
spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

clear

echo "Chapter 0: setting up"
echo -n 'Doing the folder... '
spinner &

cd ~
rm -rdf .borgtemp
mkdir .borgtemp
cd .borgtemp
echo -e "\rDoing the folder... Done."
echo -n "Writing coloured terminal definition..."
spinner &
echo "xterm-256color-italic|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color," > xterm-256color-italic.terminfo
echo -e "\rWriting coloured terminal definition... Done."
tic xterm-256color-italic.terminfo
echo "Chapter 1: brew"
echo -n "Doing the, well, brew " 
spinner &
# TODO: uncomment this on production
#echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo -e "\rDoing the, well, brew... Done."

kill "$!" # kill the spinner
printf '\n'
tput cnorm



