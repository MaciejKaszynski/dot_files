{ pkgs, ... }:
{
    environment.systemPackages = (import ./common.nix pkgs) ++ [
        pkgs.aerospace
        pkgs.proton-vpn
    ];

    homebrew.casks = [
        "bitwarden"
        "firefox"
        "freecad"
        "linearmouse"
        "steam"
        "whatsapp"
    ];
}
