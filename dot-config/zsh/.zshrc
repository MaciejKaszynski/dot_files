autoload -Uz compinit
compinit

if [[ -r "$XDG_CONFIG_HOME/yazi/quit.source" ]]; then
    source $XDG_CONFIG_HOME/yazi/quit.source
fi

# starship prompt
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# setup fzf
if command -v fzf &>/dev/null; then
    eval "$(fzf --zsh)"
fi

if [[ -r "$XDG_CONFIG_HOME/zsh/fzf-config.sh" ]]; then
    source $XDG_CONFIG_HOME/zsh/fzf-config.sh
fi

if [[ "$(uname -o)" == "Darwin" ]]; then
    alias ldd="otool -L"
fi

if [[ -r "$HOME/.cargo/env" ]]; then
    source "$HOME/.cargo/env"
fi
