# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi
if [ -f .profile ]; then
	source .profile
fi

# Source NNN config
if [ -r "$HOME/.config/nnn/nnn.source" ]; then
	source "$HOME/.config/nnn/nnn.source"
fi

#Prompt
export PS1="\[\033[38;5;10m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;12m\]:\W\[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

unset rc
