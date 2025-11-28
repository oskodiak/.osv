# ==========================================
#  USER PACKAGES - OnyxOSV
# ==========================================
# New users:
#   - Add normal applications here (browsers, editors, tools).
#   - These are installed system-wide but treated as "user apps".
#
# Advanced:
#   - Keep this file grouped with comments for clarity.

{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # ── Core CLI ───────────────────────────
    fastfetch
    htop
    ripgrep
    # git
    curl

    # ── Development ───────────────────────-
    gcc
    pkg-config

    # ── Browsers ──────────────────────────
    # firefox

    # ── Media / Misc ──────────────────────
    vlc
   
    # ── GTK / Theming ─────────────────────
    adwaita-icon-theme
    gnome-themes-extra
    gtk-engine-murrine
  ];
}
