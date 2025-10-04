source $XDG_CONFIG_HOME/yazi/quit.source
source $XDG_CONFIG_HOME/zsh/fzf-config.sh

# export PS1="%{$(tput setaf 226)%}%n%{$(tput setaf 220)%}@%{$(tput setaf 214)%}%m %{$(tput setaf 33)%}%1~ %{$(tput sgr0)%}$ "
# PROMPT="%F{blue}%n%f%F{cyan}@%f%m %~"
PROMPT="%F{blue}%n%f%F{magenta}@%f%F{yellow}%m%f %F{magenta}%~%f%F{white} $ %f"

alias cat="bat"

eval "$(fzf --zsh)"
