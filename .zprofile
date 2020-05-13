
# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin/:${PATH}"
export PATH
export SSL_CERT_FILE="/usr/local/share/curl/ca-certs.crt"
export CAFile="/usr/local/share/curl/ca-certs.crt"
export BIBINPUTS="/Users/houliu/Documents/School Work/Resources"
export TERM="xterm-256color-italic"
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
export EDITOR="/usr/local/bin/nvim"
alias tmux='tmux -2'
alias mux='tmuxinator'
export DISPLAY=:0
set -o vi
bindkey jj vi-cmd-mode
alias officevnclegacy="ssh -f -N -L 5999:127.0.0.1:5900 hliu@server.shabang.cf -p 31415; echo VNC Tunnel to server.shabang.cf Ready at Port 5999."
alias officesshlegacy="ssh hliu@server.shabang.cf -p 31415"
alias officemoshlegacy='mosh hliu@server.shabang.cf --client=/usr/local/bin/mosh-client --server=/usr/local/bin/mosh-server --ssh="ssh -p 31415"'

alias officevnc="ssh -f -N -L 5999:127.0.0.1:5900 hliu@100.80.226.43; echo VNC Tunnel to server.shabang.cf Ready at Port 5999."
alias officesshts="ssh hliu@100.80.226.43"
alias officemosh='mosh hliu@100.80.226.43 --client=/usr/local/bin/mosh-client --server=/usr/local/bin/mosh-server'
alias modapmosh='mosh houjun@mlengine.hopto.org --server=/usr/local/bin/mosh-server --ssh="ssh -p 8322"'
export PATH=/usr/local/bin:$PATH
alias gcc="/usr/local/bin/gcc-9"
alias grmdead="git fetch -p && for branch in \`git branch -vv | grep ': gone]' | awk '{print \$1}'\`; do git branch -D \$branch; done"

export PATH="/usr/local/opt/llvm/bin:$PATH"

export CC="/usr/local/opt/llvm/bin/clang"
export CXX="/usr/local/opt/llvm/bin/clang++"
export CXX11="/usr/local/opt/llvm/bin/clang++"
export CXX14="/usr/local/opt/llvm/bin/clang++"
export CXX17="/usr/local/opt/llvm/bin/clang++"
export CXX1X="/usr/local/opt/llvm/bin/clang++"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# <Toggl Shortcuts>
alias tstart="toggl start"
alias tstop="toggl stop"
alias tt="toggl continue"
alias ttt="toggl continue Transition"
alias ttb="toggl continue Biology"
alias ttm="toggl continue Mealtime"
alias tte="toggl continue Errands"
alias ttcs="toggl continue Commute\ to\ School"
alias ttch="toggl continue Commute\ to\ Home"
alias ttsr="toggl continue Running"
alias ttsw="toggl continue Swimming"
alias tnowd="toggl now -d"
alias tnowp="toggl now -o"
alias tnow="toggl now"
alias tlshead="toggl ls | head"
# </Toggl Shortcuts>

alias scratch="vim ~/Documents/Miscellaneous/__scratch__.md"

