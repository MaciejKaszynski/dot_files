# .bashrc

# Source NNN config
if [ -r "$XDG_CONFIG_HOME/nnn/nnn.source" ]; then
	source "$XDG_CONFIG_HOME/nnn/nnn.source"
fi

#Prompt
export PS1="\[\033[38;5;10m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;12m\]:\W\[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

unset rc
