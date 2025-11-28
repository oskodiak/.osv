# ==========================================
#  Home-Manager root - ospeach - OnyxOSV
# ==========================================
# New users:
#   - Controls user-level config (Waybar, GTK, etc.).

{ config, pkgs, lib, ... }:

{
  home.username = "ospeach";
  home.homeDirectory = "/home/ospeach";

  # Keep in sync with system.stateVersion.
  home.stateVersion = "25.05";

  # ─────────────────────────────────────────
  #  GTK theming
  # ─────────────────────────────────────────

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };
  };

  # ─────────────────────────────────────────
  #  Imports (Waybar etc.)
  # ─────────────────────────────────────────

  imports = [
    ./modules/waybar.nix
    ./modules/niri.nix
    # ./modules/fuzzel.nix
    # ./modules/vacuum-launcher.nix
  ];
}
