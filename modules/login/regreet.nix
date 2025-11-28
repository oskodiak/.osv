# ==========================================
#  LOGIN - GREETD + REGREET - OnyxOSV
# ==========================================
# New users:
#   - This provides a simple Wayland login screen.
#   - You don't normally need to edit this.
#
# Advanced:
#   - You can change the default session command or theme later.

{ config, pkgs, lib, ... }:

{
  # ─────────────────────────────────────────
  #  Greeter user
  # ─────────────────────────────────────────
  #
  # New users:
  #   - This is a minimal user account used only for the greeter.
  #   - It does not log in to a normal session.

  users.users.greeter = {
    isNormalUser = false;
    description = "OnyxOSV greeter user";
  };

  # ─────────────────────────────────────────
  #  greetd + regreet
  # ─────────────────────────────────────────
  #
  # New users:
  #   - This starts regreet on TTY at boot.
  #
  # Advanced:
  #   - You can change the command to launch a different greeter
  #     or a debugging shell if needed.

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.greetd.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };

  # ─────────────────────────────────────────
  #  TTY / console basics
  # ─────────────────────────────────────────

  services.getty.autologinUser = lib.mkDefault null;
}
