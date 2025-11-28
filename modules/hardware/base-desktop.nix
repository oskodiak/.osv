# ==========================================
#  BASE DESKTOP HARDWARE - OnyxOSV
# ==========================================
# New users:
#   - You normally don't need to edit this file.
#   - It provides audio, input, firmware, and a few safe defaults
#     for most desktop systems.
#
# Advanced:
#   - You can tune power, firmware, or extra hardware bits here.
#   - Disks and filesystems still live ONLY in hardware-configuration.nix.

{ config, pkgs, lib, ... }:

{
  # ─────────────────────────────────────────
  #  Firmware / microcode
  # ─────────────────────────────────────────
  #
  # New users:
  #   - Leave these enabled. They help with hardware support and
  #     CPU security updates on both Intel and AMD.
  #
  # Advanced:
  #   - You can disable firmware or change microcode settings if
  #     you know your exact hardware needs.

  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;

  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

 # ─────────────────────────────────────────
  #  Audio / PipeWire (low-latency)
  # ─────────────────────────────────────────
  #
  # New users:
  #   - This is a low-latency PipeWire setup that works well for
  #     gaming, media, and general desktop use.
  #   - You usually don't need to change this.
  #
  # Advanced:
  #   - Tweak the clock.rate / quantum values if you know what
  #     you're aiming for (e.g. pro audio workloads).

  sound.enable = true;
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
    jack.enable = true;

    wireplumber.enable = true;

    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock.rate        = 48000;
        default.clock.quantum     = 256;
        default.clock.min-quantum = 256;
        default.clock.max-quantum = 256;
      };
    };
  };

  # ─────────────────────────────────────────
  #  Input (mouse, touchpad, etc.)
  # ─────────────────────────────────────────
  #
  # New users:
  #   - This is safe to leave as-is for both X11 and Wayland.
  #
  # Advanced:
  #   - You can tweak libinput options in a separate module if needed.

  services.libinput.enable = true;

  # ─────────────────────────────────────────
  #  Bluetooth
  # ─────────────────────────────────────────
  #
  # New users:
  #   - Leave this enabled if you use Bluetooth audio or devices.
  #
  # Advanced:
  #   - Disable if you know you don't have or want Bluetooth.

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # ─────────────────────────────────────────
  #  Virtualization helpers (KVM)
  # ─────────────────────────────────────────
  #
  # New users:
  #   - These kernel modules are light and safe to keep.
  #
  # Advanced:
  #   - You can remove the one you don't need if you want an
  #     ultra-minimal kernel module set.

  boot.kernelModules = [
    "kvm-intel"
  # "kvm-amd"
  ];

  # ─────────────────────────────────────────
  #  (Optional) Initrd / kernel tuning
  # ─────────────────────────────────────────
  #
  # IMPORTANT:
  #   - Disks, filesystems, and most initrd modules should be kept
  #     in hardware-configuration.nix, not here.
  #
  # New users:
  #   - Leave this section alone or keep it empty.
  #
  # Advanced:
  #   - Add ONLY generic extras here if absolutely necessary.
  #
  # Example (commented out on purpose):
  #
  # boot.initrd.availableKernelModules = [
  #   "xhci_pci" "ehci_pci" "ahci"
  #   "usbhid" "usb_storage" "sd_mod"
  # ];

}
