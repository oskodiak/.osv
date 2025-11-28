# ==========================================
#  OnyxOSV - Core Flake
# ==========================================
# New users:
#   - You normally don't touch this file.
#   - Rebuild with:
#       sudo nixos-rebuild switch --flake ~/.osv#ospeach
#
# Advanced:
#   - Add more nixosConfigurations for other users/machines.

{
  description = "OnyxOSV - Niri-based, user-centric NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home-Manager will be wired in later:
    # home-manager = {
    #   url = "github:nix-community/home-manager/release-24.05";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      ospeach = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./users/ospeach.nix
          # Home-Manager module gets added here later.
        ];
      };
    };
  };
}
