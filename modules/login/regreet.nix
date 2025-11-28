# ==========================================
#  LOGIN - greetd + regreet - OnyxOSV
# ==========================================
# - Uses official programs.regreet module
# - Keeps greetd simple and robust
#
{ config, pkgs, lib, ... }:

{
  # Install and configure ReGreet
  programs.regreet = {
    enable = true;

    # Basic dark theme so it doesn’t look like trash
    theme.name = "Adwaita-dark";
    iconTheme.name = "Adwaita";
    font.name = "Hack";

    # You can tweak programs.regreet.settings later if you want fancy stuff
  };

  # Enable greetd; regreet’s module wires the default_session for us
  services.greetd = {
    enable = true;
    vt = 1;
  };

  # Make sure we don't autologin on tty1
  services.getty.autologinUser = lib.mkDefault null;
}