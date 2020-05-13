
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


