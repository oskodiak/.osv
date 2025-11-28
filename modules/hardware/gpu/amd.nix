# ==========================================
#  GPU PROFILE - AMD (AMDGPU)
# ==========================================
# New users:
#   - Don't edit this file directly.
#   - In users/<name>.nix, choose ONE GPU profile to import.
#
# Advanced:
#   - You can adjust kernel parameters or extra packages here
#     if you know what you're doing.
#
# This module:
#   - Forces use of the amdgpu driver.
#   - Ensures 32-bit graphics support for games.
#   - Optionally adds AMD-specific kernel params.

{ config, pkgs, lib, ... }:

{
  # ─────────────────────────────────────────
  #  X11 / DRM driver selection
  # ─────────────────────────────────────────
  #
  # Even on Wayland, this often influences which kernel
  # DRM driver gets used.

  services.xserver.videoDrivers = [ "amdgpu" ];

  # ─────────────────────────────────────────
  #  OpenGL / 32-bit support
  # ─────────────────────────────────────────
  #
  # New users:
  #   - Leave these enabled for gaming and 32-bit apps.
  #
  # Advanced:
  #   - You can trim packages later if you want a slimmer build.

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    # Useful tools for debugging GPU issues
    vulkan-tools       # vulkaninfo
    mesa-demos         # glxinfo, glxgears, etc.
    libva-utils        # vainfo for video accel
  ];

  # ─────────────────────────────────────────
  #  AMD kernel parameters (optional)
  # ─────────────────────────────────────────
  #
  # These toggles relate to Southern Islands / Sea Islands (SI/CIK).
  # On newer cards, they're usually harmless; on some older cards
  # they can help if amdgpu isn't behaving out of the box.
  #
  # New users:
  #   - You can ignore this section unless you know your card
  #     is very old and needs special handling.

  boot.kernelParams = [
    "amdgpu.si_support=1"
    "amdgpu.cik_support=1"
  ];
}
