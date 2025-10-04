#!/bin/sh

TEMP_DIR="$HOME/.cache"

########################################
# Given a git url, returns the last tag
# Arguments:
#   Git url
# Outputs:
#   Latest tag
########################################
latest_git_tag()
{
    url="$1"
    git ls-remote --tags --refs "$url" | awk '{print $2}' | sort -V | tail -n 1 | cut -d'/' -f3
}

#####################################
# Does a shallow clone of a git repo
# Arguments:
#   Git url
#   Reference, git tag or branch
#   Out directory
#####################################
shallow_git_clone()
{
    url="$1"
    ref="$2"
    out_dir="$3"
    git clone --depth 1 --branch "$ref" "$url" "$out_dir"
}

#######################################
# Installs Yazi from the releases repo
# Globals:
#   TEMP_DIR
# Arguments:
#   None
#######################################
install_yazi()
{
    url="git@github.com:sxyazi/yazi.git"
	yazi_zip="$TEMP_DIR/yazi.zip"
	yazi_temp_dir="$TEMP_DIR/yazi"
	yazi_install_dir="$HOME/.local/bin"

    latest_tag="$(latest_git_tag $url)"

	echo "Installing from tag ${latest_tag}"
    echo "Press Enter to continue, or press CTRL-C to exit"
	read -r temp
    zip_url="https://github.com/sxyazi/yazi/releases/download/$latest_tag/yazi-x86_64-unknown-linux-gnu.zip"

	curl -L -o "$yazi_zip" "$zip_url"
	unzip -jqo "$yazi_zip" -d "$yazi_temp_dir"
	install "$yazi_temp_dir/yazi" "$yazi_install_dir"
	install "$yazi_temp_dir/ya" "$yazi_install_dir"
}

######################################
# Builds and installs the last neovim
# Globals:
#   TEMP_DIR
# Arguments:
#   None
######################################
build_neovim()
{
    URL="git@github.com:neovim/neovim.git"
    NEOVIM_TEMP_DIR="$TEMP_DIR/neovim"

    LATEST_TAG="$(latest_git_tag $URL)"

	echo "Installing from tag ${LATEST_TAG}"
	echo "Press Enter to continue, or press CTRL-C to exit"
	read -r temp

    shallow_git_clone "$URL" "$LATEST_TAG" "$NEOVIM_TEMP_DIR"
    (
        cd "$NEOVIM_TEMP_DIR" || exit 1
        make CMAKE_BUILD_TYPE=Release
        sudo make install
    )
}

main()
{
    if command -v nvim &> /dev/null; then
        echo "Neovim already installed skipping build"
    else
        build_neovim
    fi

    if command -v yazi &> /dev/null; then
        echo "Yazi already installed skipping build"
    else
        install_yazi
    fi
}

main
