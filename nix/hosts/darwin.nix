{ pkgs, self, ... }:
{
    imports = [ ./common.nix ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = "nix-command flakes";
    system.configurationRevision = self.rev or self.dirtyRev or null;
    system.stateVersion = 6;
    nixpkgs.hostPlatform = "aarch64-darwin";

    system.primaryUser = "maciej";
    users.users.maciej = {
        name = "maciej";
        home = "/Users/maciej";
    };

    environment.systemPackages = [
        pkgs.aerospace
        pkgs.feishin
        pkgs.proton-vpn
        pkgs.mpv
        pkgs.wezterm
        pkgs.vscodium
    ];

    fonts.packages = [ pkgs.nerd-fonts.iosevka ];

    homebrew = {
        enable = true;
        casks = [
            "bitwarden"
            "firefox"
            "freecad"
            "linearmouse"
            "steam"
            "whatsapp"
        ];
        # don't cleanup other packages
        onActivation.cleanup = "none";
    };
}
