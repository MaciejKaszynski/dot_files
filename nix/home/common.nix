{ pkgs, ... }:
{
    imports = [ ./dotfiles.nix ];

    programs.home-manager.enable = true;

    home.packages = [
        # shell tools
        pkgs.claude-code
        pkgs.delta
        pkgs.doxygen
        pkgs.ffmpeg
        pkgs.fzf
        pkgs.gh
        pkgs.gnupg
        pkgs.imagemagick
        pkgs.jq
        pkgs.just
        pkgs.ncdu
        pkgs.neovim
        pkgs.pre-commit
        pkgs.ripgrep
        pkgs.starship
        pkgs.tree-sitter
        pkgs.yazi
        pkgs.yt-dlp

        # language servers
        pkgs.bash-language-server
        pkgs.clang-tools
        pkgs.cmake-language-server
        pkgs.lua-language-server
        pkgs.pyright
        pkgs.ruff
        pkgs.yaml-language-server

        # toolchains
        pkgs.bazelisk
        pkgs.clang
        pkgs.cmake
        pkgs.lcov
        pkgs.llvm
        pkgs.python314
        pkgs.rustup
    ];
}
