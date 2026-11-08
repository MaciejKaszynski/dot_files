{ pkgs, ... }:
{
    home.packages = import ./common.nix pkgs;
}
