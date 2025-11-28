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

  # programs.steam.enable = true;
  # services.printing.enable = true;
}
