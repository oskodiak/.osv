# ==========================================
#  DESKTOP - Niri (system-level) - OnyxOSV
# ==========================================
# New users:
#   - This module makes sure Niri is available on the system.
#   - Actual Niri behavior will be configured via Home-Manager.
#
# Advanced:
#   - Later, you can add system-level session registration here
#     if needed for greetd/regreet.

{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    niri
  ];

  # Future: session files or extra system-level tweaks.
}
