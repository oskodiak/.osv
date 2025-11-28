{
  description = "OnyxOSV - Niri-based, user-centric NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      ospeach = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./users/ospeach.nix

          # Home-Manager as a NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # Tells Home-Manager to backup dotfiles with bak file extension instead of failing
            home-manager.backupFileExtension = "bak";
            home-manager.users.ospeach = import ./home/ospeach.nix;
          }
        ];
      };
    };
  };
}
