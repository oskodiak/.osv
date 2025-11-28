# ==========================================
#  GPU PROFILE - NVIDIA PRIME (HYBRID)
# ==========================================
# New users:
#   - Use this if your laptop has Intel + NVIDIA hybrid graphics.
#   - Do NOT import another GPU profile at the same time.
#
# Advanced:
#   - Adjust offload mode or driver package if needed.

{ config, pkgs, lib, ... }:

{
  # ─────────────────────────────────────────
  #  Driver selection
  # ─────────────────────────────────────────
  #
  # We still use the NVIDIA driver, but in a PRIME / offload setup.

  services.xserver.videoDrivers = [ "nvidia" ];

  # ─────────────────────────────────────────
  #  OpenGL / 32-bit support
  # ─────────────────────────────────────────

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # ─────────────────────────────────────────
  #  NVIDIA PRIME configuration
  # ─────────────────────────────────────────
  #
  # New users:
  #   - This enables offloading (render on NVIDIA, display via Intel).
  #   - Commands like `nvidia-offload <prog>` can be used.

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload.enable = true;
      # sync.enable = true;  # Alternative mode, pick one if needed.
    };
  };

  boot.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
  ];

  environment.systemPackages = with pkgs; [
    nvidia-smi
    nvidia-settings
  ];
}
