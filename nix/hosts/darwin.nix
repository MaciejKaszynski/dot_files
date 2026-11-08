{ config, pkgs, self, ... }:
{
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

    # launched apps don't read ~/.zshenv, so give them the
    # same cargo/rustup locations
    launchd.user.envVariables = {
        CARGO_HOME = "${config.users.users.maciej.home}/.local/share/cargo";
        RUSTUP_HOME = "${config.users.users.maciej.home}/.local/share/rustup";
    };

    fonts.packages = [
        pkgs.nerd-fonts.iosevka
        pkgs.maple-mono.NF
    ];

    homebrew = {
        enable = true;
        # don't cleanup other packages
        onActivation.cleanup = "none";
    };
}
