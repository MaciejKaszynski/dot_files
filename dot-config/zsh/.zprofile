if command -v brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

# bob (neovim version manager)
if [[ -r "$HOME/.local/share/bob/env/env.sh" ]]; then
    source "$HOME/.local/share/bob/env/env.sh"
fi
