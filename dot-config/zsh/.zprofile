if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif command -v brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

# -p if prepend
add-path() {
    local prepend=0
    if [[ $1 == -p ]]; then prepend=1; shift; fi
    local dir="${1%/}"
    [[ -d "$dir" && -x "$dir" ]] || return 0
    (( ${path[(Ie)$dir]} )) && return 0
    if (( prepend )); then path=("$dir" $path); else path+=("$dir"); fi
}

add-path "$CARGO_HOME/bin"
add-path -p "$HOME/.local/bin"

unfunction add-path
