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
    let
        # set `gui = false` on a config to leave out all GUI apps
        optionalGui = gui: file: nixpkgs.lib.optional gui file;
    in
    {
        homeConfigurations."maciej@linux" = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
                system = "x86_64-linux";
                config.allowUnfree = true;
            };
            extraSpecialArgs = { dotfilesSrc = self.sourceInfo.outPath; };
            modules = [ ./home/linux.nix ]
                ++ optionalGui false ./gui/linux.nix;
        };

        darwinConfigurations."Macbook" = nix-darwin.lib.darwinSystem {
            specialArgs = { inherit self; };
            modules = [
                ./hosts/darwin.nix
            ] ++ optionalGui true ./gui/darwin.nix ++ [
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
