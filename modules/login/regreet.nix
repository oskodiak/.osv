# ==========================================
#  LOGIN - GREETD + REGREET - OnyxOSV
# ==========================================
# New users:
#   - This provides a Wayland login screen.
#   - You don't normally need to edit this.
#
# Advanced:
#   - You can change the default session command or VT later.

{ config, pkgs, lib, ... }:

{
  # ─────────────────────────────────────────
  #  Greeter user / group
  # ─────────────────────────────────────────
  #
  # New users:
  #   - This user runs the greeter only.
  #   - It is not for normal login.

  users.groups.greeter = { };

  users.users.greeter = {
    isNormalUser = false;
    description = "OnyxOSV greeter user";
    group = "greeter";
    home = "/var/lib/greetd";
    createHome = true;
  };

  # ─────────────────────────────────────────
  #  Log directory for regreet (optional)
  # ─────────────────────────────────────────
  #
  # New users:
  #   - This prevents "permission denied" when regreet tries to log.
  #
  # Advanced:
  #   - You can change this or drop it if you don't care about logs.

  systemd.tmpfiles.rules = [
    "d /var/log/regreet 0755 greeter greeter -"
  ];

  # ─────────────────────────────────────────
  #  greetd + regreet
  # ─────────────────────────────────────────

  services.greetd = {
    enable = true;
    vt = 1;

    settings = {
      default_session = {
        command = "${pkgs.greetd.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };

  # ─────────────────────────────────────────
  #  Disable TTY autologin
  # ─────────────────────────────────────────

  services.getty.autologinUser = lib.mkDefault null;
}

