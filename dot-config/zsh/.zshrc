if [[ $OSTYPE == darwin* ]]; then
    alias ldd="otool -L"
fi

if [[ -r "$XDG_CONFIG_HOME/yazi/quit.source" ]]; then
    source "$XDG_CONFIG_HOME/yazi/quit.source"
fi

# history
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

if [[ -d "$ZDOTDIR/completions" ]]; then
    fpath=("$ZDOTDIR/completions" $fpath)
fi

# navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS

# completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit
() {
    setopt local_options extended_glob
    if [[ -n $ZDOTDIR/.zcompdump(#qN.mh+24) ]]; then
        compinit
    else
        compinit -C
    fi
}

if [[ -r "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if command -v fzf &>/dev/null; then
    eval "$(fzf --zsh)"
    if [[ -r "$ZDOTDIR/plugins/fzf-git.sh/fzf-git.sh" ]]; then
        source "$ZDOTDIR/plugins/fzf-git.sh/fzf-git.sh"
    fi
fi

if [[ -r "$ZDOTDIR/secrets.sh" ]]; then
    source "$ZDOTDIR/secrets.sh"
fi

if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# must be sourced last
if [[ -r "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [[ -r "/etc/profile.d/cntlm.sh" ]]; then
    source /etc/profile.d/cntlm.sh
fi
