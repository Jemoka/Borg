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
echo

echo "Alrighty, buckle up, because this is going to be fun!"
echo "Hiding cursor..."
tput civis
echo "Defining spinner..."
function shutdown() {
  tput cnorm # reset cursor
}
trap shutdown EXIT

function cursorBack() {
  echo -en "\033[$1D"
}

function spinner() {
  # make sure we use non-unicode character type locale 
  # (that way it works for any locale as long as the font supports the characters)
  local LC_CTYPE=C

  local pid=$1 # Process Id of the previous running command

  case 11 in
  0)
    local spin='⠁⠂⠄⡀⢀⠠⠐⠈'
    local charwidth=3
    ;;
  1)
    local spin='-\|/'
    local charwidth=1
    ;;
  2)
    local spin="▁▂▃▄▅▆▇█▇▆▅▄▃▂▁"
    local charwidth=3
    ;;
  3)
    local spin="▉▊▋▌▍▎▏▎▍▌▋▊▉"
    local charwidth=3
    ;;
  4)
    local spin='←↖↑↗→↘↓↙'
    local charwidth=3
    ;;
  5)
    local spin='▖▘▝▗'
    local charwidth=3
    ;;
  6)
    local spin='┤┘┴└├┌┬┐'
    local charwidth=3
    ;;
  7)
    local spin='◢◣◤◥'
    local charwidth=3
    ;;
  8)
    local spin='◰◳◲◱'
    local charwidth=3
    ;;
  9)
    local spin='◴◷◶◵'
    local charwidth=3
    ;;
  10)
    local spin='◐◓◑◒'
    local charwidth=3
    ;;
  11)
    local spin='⣾⣽⣻⢿⡿⣟⣯⣷'
    local charwidth=3
    ;;
  esac

  local i=0
  tput civis # cursor invisible
  while kill -0 $pid 2>/dev/null; do
    local i=$(((i + $charwidth) % ${#spin}))
    printf "%s" "${spin:$i:$charwidth}"

    cursorBack 1
    sleep .1
  done
  tput cnorm
  wait $pid # capture exit code
  return $?
}
clear
echo
echo "Chapter 0: setting up"
echo "======================"
echo -n 'Doing the folder... '
cd ~
rm -rdf .borgtemp
mkdir .borgtemp
cd .borgtemp
echo -e "\rDoing the folder... Done."
echo -n "Writing coloured terminal definition... "
echo "xterm-256color-italic|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color," > xterm-256color-italic.terminfo
tic xterm-256color-italic.terminfo
echo -e "\rWriting coloured terminal definition... Done."
clear
echo
echo "Chapter 1: brew"
echo "================"
if hash brew 2>/dev/null; then
    echo "Welp, somebody installed brew already. Let's press on then."
else
    echo -n "Okey, I am passing the mic to the brew installer. Follow any instructions." 
    # TODO: uncomment this on production
    echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    spinner $!
    echo -e "\rDoing the, well, brew... Done."
fi
clear
echo
echo "Chapter 2: brewing packages"
echo "============================"
echo -n "Installing tmux, mosh, zsh, git, and nvim... "
(brew install tmux mosh nvim zsh git) &>/dev/null &
spinner $!
wait $!
echo -e "\rInstalling tmux, mosh, zsh, git, and nvim... Done."
tput cnorm
clear
echo
echo "Chapter 3: downloading config files repo"
echo "========================================="
echo -n "Using git to clone the Borg src... "
git clone https://github.com/Jemoka/Borg --quiet &> /dev/null &
spinner $!
wait $!
echo -e "\rUsing git to clone the Borg src... Done."
clear
echo
echo "Chapter 4: copying config files"
echo "================================"
echo -n "Copying the config profiles... "
(cp Borg/src/.tmux.conf ~/; cp Borg/src/.zprofile ~/; cp Borg/src/.zshrc ~/; cp Borg/src/.tmux.conf ~/; mkdir .tmux; mkdir ~/.config; mkdir ~/.config/nvim; cp Borg/src/nvim/init.vim ~/.config/nvim/; cp -r Borg/src/nvim/UltiSnips ~/.config/nvim/) &> /dev/null &
spinner $!
wait $!
echo -e "\rCopying the config profiles... Done."
clear
echo
echo "Borg v0.0.1. We assimilated."
echo "=========================================================="
echo "It may be a good idea to restart."
echo "Brought to you by @jemoka"

#sleep 10 &
#spinner $!; wait $!



