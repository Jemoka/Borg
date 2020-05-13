source ~/.p10k.zsh

setopt autocd

alias c="clear"
alias l="ls"
alias vim="nvim"


export ZPLUG_HOME=~/.zplug/
export ZPLUG_REPOS=~/.zplug/repos/ 
export ZPLUG_LOADFILE=~/.zplug/packages.zsh
export ZPLUG_BIN=~/.zplug/bin
export ZPLUG_CACHE_DIR=~/.zplug/cache
export ZPLUG_ERROR_LOG=~/.zplug/.error_log
source ~/.zplug/init.zsh
# Plugins!
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug zsh-users/zsh-autosuggestions
zplug "plugins/git", from:oh-my-zsh
# Fire!
if ! zplug check; then
    echo; zplug install
fi
zplug load

ZSH_AUTOSUGGEST_STRATEGY="completion"
ZSH_AUTOSUGGEST_USE_ASYNC="true"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -z $TMUX ]] && [ -x /usr/libexec/path_helper ]; then
        eval `/usr/libexec/path_helper -s`
fi

if [[ -z $TMUX ]]; then
  export PATH=$PATH:/foo
fi

# Prevent sleep
if expr "$(ps -o comm= $PPID)" : '^sshd:' > /dev/null; then
  caffeinate -s $SHELL --login
  exit $?
fi

