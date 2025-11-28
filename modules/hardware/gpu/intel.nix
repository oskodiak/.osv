# ==========================================
#  GPU PROFILE - INTEL
# ==========================================
# New users:
#   - Use this on Intel iGPU-only systems.
#   - Don't edit this file directly.
#
# Advanced:
#   - You can tweak kernel params or add tools here.

{ config, pkgs, lib, ... }:

{
  # ─────────────────────────────────────────
  #  Driver selection
  # ─────────────────────────────────────────
  #
  # For modern Intel graphics, modesetting is generally preferred.
  # NixOS often handles this automatically, but we keep it explicit.

  services.xserver.videoDrivers = [ "modesetting" ];

  # ─────────────────────────────────────────
  #  OpenGL / 32-bit support
  # ─────────────────────────────────────────

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools   # vulkaninfo
    mesa-demos     # glxinfo, glxgears
    intel-gpu-tools
  ];

  # ─────────────────────────────────────────
  #  Optional Intel kernel parameters
  # ─────────────────────────────────────────
  #
  # New users:
  #   - Leave this empty unless you hit specific Intel driver issues.

  # boot.kernelParams = [
  #   "i915.enable_psr=0"
  # ];
}
