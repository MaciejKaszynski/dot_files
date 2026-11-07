{
    description = "Personal nix config (nix-darwin on macOS, home-manager elsewhere)";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:nix-darwin/nix-darwin/master";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
    {
        darwinConfigurations."Macbook" = nix-darwin.lib.darwinSystem {
            specialArgs = { inherit self; };
            modules = [
                ./hosts/darwin.nix
                home-manager.darwinModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.backupFileExtension = "hm-backup";
                    home-manager.extraSpecialArgs = { dotfilesSrc = self.sourceInfo.outPath; };
                    home-manager.users.maciej = import ./home/darwin.nix;
                }
            ];
        };
    };
}
