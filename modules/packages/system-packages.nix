# ==========================================
#  SYSTEM FEATURES (programs/services) - OnyxOSV
# ==========================================
# New users:
#   - Enable system-level features here (Steam, printing, etc.).
#
# Advanced:
#   - This is for programs.*.enable and services.*.enable options,
#     not simple one-off packages.

{ config, pkgs, lib, ... }:

{
  # Example (commented for now):

# Programs
  programs.steam.enable = true;

# Services
  services.printing.enable = true;

# System Packages
  environment.systemPackages = with pkgs; {
    swaylock
  ];
}
