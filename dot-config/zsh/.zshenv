export BAT_THEME="rose-pine"

if [[ "$(uname -o)" == "Darwin" ]]; then
    alias ldd="otool -L"
fi
. "$HOME/.cargo/env"

# uv
export PATH="/Users/maciej/.local/bin:$PATH"
. "/Users/maciej/.local/share/bob/env/env.sh"
