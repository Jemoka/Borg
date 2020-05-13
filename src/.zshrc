
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

setopt autocd

alias c="clear"
alias l="ls"
alias vim="nvim"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zplug settings
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/houliu/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/houliu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/houliu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/houliu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


#compdef toggl
_toggl() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _TOGGL_COMPLETE=complete-zsh  toggl)
}
if [[ "$(basename -- ${(%):-%x})" != "_toggl" ]]; then
  autoload -U compinit && compinit
  compdef _toggl toggl
fi
#compdef toggl
_toggl() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _TOGGL_COMPLETE=complete-zsh  toggl)
}
if [[ "$(basename -- ${(%):-%x})" != "_toggl" ]]; then
  autoload -U compinit && compinit
  compdef _toggl toggl
fi
