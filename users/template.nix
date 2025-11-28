# ==========================================
#  USER CONFIGURATION TEMPLATE - OnyxOSV
# ==========================================
# Copy this file to users/<yourname>.nix and adjust.
# Keep changes small and readable. One thing at a time.

{ config, pkgs, lib, ... }:

{
  # ─────────────────────────────────────────
  #  Identity
  # ─────────────────────────────────────────
  #
  # This is the system hostname. It shows up in your shell
  # prompt and on the network. It does NOT select your config;
  # the flake target (.#yourname) does that.

  networking.hostName = "onyxosv";

  users.users.yourname = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
    # New users: you usually don't need to change this.
    # Advanced: add groups if you know exactly why you need them.
  };

  # ─────────────────────────────────────────
  #  Imports
  # ─────────────────────────────────────────
  #
  # These imports pull in your hardware, desktop, and packages.
  # New users: usually only switch the GPU line below.

  imports = [
    # Hardware layout (disks, filesystems, boot). Do not edit.
    ../hardware-configuration.nix

    # Base desktop hardware: audio, input, firmware, etc.
    ../modules/hardware/base-desktop.nix

    # Choose exactly ONE GPU profile:
    ../modules/hardware/gpu/intel.nix
    # ../modules/hardware/gpu/amd.nix
    # ../modules/hardware/gpu/nvidia.nix
    # ../modules/hardware/gpu/nvidia-prime.nix

    # Login + desktop stack:
    ../modules/login/regreet.nix
    ../modules/desktop/niri.nix
    ../modules/desktop/waybar.nix
    ../modules/desktop/fuzzel.nix
    ../modules/desktop/vacuum-launcher.nix

    # Packages:
    ../modules/packages/user-packages.nix
    ../modules/packages/system-packages.nix

    # Home-Manager (wired in later):
    # ../home/yourname.nix
  ];

  # ─────────────────────────────────────────
  #  Base system packages (optional)
  # ─────────────────────────────────────────
  #
  # Most packages should go in user-packages.nix.
  # Use this only for a few essentials tied directly to this config.

  environment.systemPackages = with pkgs; [
    firefox
    ghostty
    git
  ];

  # ─────────────────────────────────────────
  #  Networking
  # ─────────────────────────────────────────

  networking.networkmanager.enable = true;
}
