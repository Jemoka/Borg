#!/bin/bash

# Hide the spinner

# First things first, say hi
clear
echo "Borg v0.0.1. We will assimilate your zsh (with consent though)."
echo "================================================================"
echo "Action Plan Today:
[ ] Configure coloured xterm
[ ] Install Brew
[ ] Install tmux, nvim, mosh
[ ] Configure all that we installed
[ ] Add powerlevel10k theme to zsh
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

  #local spin='⠁⠂⠄⡀⢀⠠⠐⠈'
  #local charwidth=3

  local spin='⣾⣽⣻⢿⡿⣟⣯⣷'
  local charwidth=3

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
echo "Chapter 0: brew"
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
echo "Chapter 1: brewing packages"
echo "============================"
echo -n "Installing tmux, mosh, zsh, git, python3, and nvim... "
(brew install tmux mosh nvim tmuxinator zsh git python3) &>/dev/null &
spinner $!
wait $!
echo -e "\rInstalling tmux, mosh, zsh, git, python3, and nvim... Done."
tput cnorm
clear
echo
echo "Chapter 2: setting up"
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
  use=xterm-256color," >> xterm-256color-italic.terminfo
/usr/local/bin/zsh -c -l "tic xterm-256color-italic.terminfo" 
echo -e "\rWriting coloured terminal definition... Done."
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
(cp Borg/src/.tmux.conf ~/; cp Borg/src/.zprofile ~/; cp Borg/src/.zshrc ~/; cp Borg/src/.tmux.conf ~/; mkdir .tmux; mkdir ~/.config; mkdir ~/.config/nvim; cp Borg/src/nvim/init.vim ~/.config/nvim/; cp -r Borg/src/nvim/UltiSnips ~/.config/nvim/; mkdir ~/.tmux/) &> /dev/null &
spinner $!
wait $!
echo -e "\rCopying the config profiles... Done."
clear
echo
echo "Chapter 5: zsh plugins"
echo "======================="
echo -n "Cloning zplug... "
export ZPLUG_HOME=~/.zplug/
git clone https://github.com/zplug/zplug $ZPLUG_HOME &> /dev/null &
spinner $!
wait $!
echo -e "\rCloning zplug... Done."
echo -n "Patching zplug... "
cd ~/.zplug/base/core/
sed -i '' 's/compinit -d/compinit -u -d/' load.zsh
cd ~/.borgtemp
echo -e "\rPatching zplug... Done."
echo "Running zplug install..."
echo
echo -n "@@DO NOT STOP BORG AFTER THIS COMPLETES@@"
cd ~
/usr/local/bin/zsh -i -c echo; (zplug install &> /dev/null) &> /dev/null &
spinner $!
wait $!
echo -e "\rRunning zplug install... Done."
clear
echo
echo "Chapter 6: (n)vim plugins"
echo "========================="
echo -n "Cloning vim-plug... "
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &> /dev/null &
spinner $!
wait $!
echo -e "\rCloning vim-plug... Done."
echo -n "Installing plugins... "
nvim -c "PlugInstall" &> /dev/null &
spinner $!
wait $!
echo -e "\rInstalling plugins... Done."
echo -n "Installing neovim Python3 pkg... "
/usr/local/bin/python3 -m pip install neovim &> /dev/null &
spinner $!
wait $!
echo -e "\rInstalling neovim Python pkg... Done."
clear
echo
echo "Chapter 7: tmux plugins"
echo "======================="
echo -n "Cloning tpm... "
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &> /dev/null &
spinner $!
wait $!
echo -e "\rCloning tpm... Done."
echo -n "Sourcing tpm plugins... "
~/.tmux/plugins/tpm/bin/install_plugins &> /dev/null &
spinner $!
wait $!
echo -e "\rSourcing tpm plugins... Done."
clear
echo
echo "Chapter 8: cleanup, cleanup"
echo "==========================="
echo -n "everybody everywhere... "
cd ~
rm -rfd ~/.borgtemp &> /dev/null &
spinner $!
wait $!
echo -e "\reverybody everywhere... Done."
clear
echo
echo "Borg v0.0.1. We assimilated (your shell)."
echo "=========================================================="
echo "@@@ Now, its your turn @@@"
echo "## Task 1 ##"
echo "It is a good idea to restart this shell session."
echo "If you get no color or weird display things, set your terminal"
echo "emulator to xterm-256color-italic. In iTerm, that's in"
echo "Settings -> Profiles -> Terminal -> Report Terminal Type."
echo "## Task 2 ##"
echo "When you first load, PowerLevel10k will guide you though"
echo "the setup process of your terminal interface."
echo "## Task 3 ##"
echo "If you are using bash, shame on you. All of the changes"
echo "are done to zsh, because its the superior shell. Check"
echo "zsh (at /usr/local/bin/zsh), and if you are happy with"
echo "it, then set your login shell to zsh."
echo "=========================================================="
echo "Script brought to you by @jemoka"
echo "Beep. beep. boop."

#sleep 10 &
#spinner $!; wait $!



