# ==========================================
#  DESKTOP - Fuzzel launcher (system-level) - OnyxOSV
# ==========================================
# New users:
#   - Installs fuzzel so it can be used as the app launcher.
#   - Config (theme, behavior) will come from Home-Manager later.

{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    fuzzel
  ];
}
