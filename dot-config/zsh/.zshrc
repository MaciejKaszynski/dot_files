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

if [[ -r "$HOME/.local/bin" ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi
