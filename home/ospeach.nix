# ==========================================
#  Home-Manager root - ospeach - OnyxOSV
# ==========================================
# New users:
#   - This controls user-level config (Niri, Waybar, GTK, etc.).
#
# Advanced:
#   - Add more imports here as you grow your setup.

{ config, pkgs, lib, ... }:

{
  home.username = "ospeach";
  home.homeDirectory = "/home/ospeach";

  # Keep this in sync with system.stateVersion for now.
  home.stateVersion = "25.05";

  imports = [
    ./modules/niri.nix
    ./modules/waybar.nix
    # ./modules/fuzzel.nix
    # ./modules/vacuum-launcher.nix
  ];
}
