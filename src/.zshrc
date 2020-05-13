source ~/.p10k.zsh

setopt autocd

alias c="clear"
alias l="ls"
alias vim="nvim"

source ~/.zplug/init.zsh
# Plugins!
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug zsh-users/zsh-autosuggestions
zplug "plugins/git", from:oh-my-zsh
# Fire!
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

