{ ... }:
{
    imports = [ ./common.nix ];

    home.username = "maciej";
    home.homeDirectory = "/home/maciej";
    home.stateVersion = "24.05";
    home.backupFileExtension = "hm-backup";
}
