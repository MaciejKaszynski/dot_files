# .bash_profile

export VISUAL="nvim"
export EDITOR="$VISUAL"
export TERMINAL="alacritty"

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
