# ==========================================
#  DESKTOP - Waybar (system-level) - OnyxOSV
# ==========================================
# New users:
#   - Ensures Waybar is installed.
#   - Layout / theme will be managed by Home-Manager later.

{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    waybar
  ];
}
