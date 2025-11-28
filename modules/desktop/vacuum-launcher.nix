# ==========================================
#  DESKTOP - VacuumLauncher (system-level) - OnyxOSV
# ==========================================
# New users:
#   - Installs the eww / VacuumLauncher pieces.
#   - Actual widgets and layout will live in Home-Manager later.

{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    eww
    # Later: your forked VacuumLauncher package if it’s separate.
  ];
}
