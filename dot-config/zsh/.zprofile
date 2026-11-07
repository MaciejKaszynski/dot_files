if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif command -v brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

if [[ -d "$HOME/.cargo/bin" ]]; then
    path+=("$HOME/.cargo/bin")
fi

path=("$HOME/.local/bin" $path)
