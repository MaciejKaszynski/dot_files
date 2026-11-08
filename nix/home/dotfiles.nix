{ config, lib, dotfilesSrc, ... }:
let
    dotfiles = "${config.home.homeDirectory}/.local/share/dot_files";
    link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";

    binDir = "${dotfilesSrc}/bin";
    scripts = lib.optionalAttrs (builtins.pathExists binDir)
        (lib.filterAttrs (_: type: type == "regular") (builtins.readDir binDir));
    binLinks = lib.mapAttrs'
        (name: _: lib.nameValuePair ".local/bin/${name}" { source = link "bin/${name}"; })
        scripts;
in
{
    xdg.configFile = {
        "aerospace".source     = link "dot-config/aerospace";
        "ghostty".source       = link "dot-config/ghostty";
        "nix".source           = link "nix";
        "nvim".source          = link "dot-config/nvim";
        "starship.toml".source = link "dot-config/starship.toml";
        "wezterm".source       = link "dot-config/wezterm";
        "yazi".source          = link "dot-config/yazi";
        "zsh".source           = link "dot-config/zsh";
    };

    # ~/<name>
    home.file = {
        ".profile".source      = link "dot-profile";
        ".zshenv".source       = link "dot-zshenv";
    } // binLinks;
}
