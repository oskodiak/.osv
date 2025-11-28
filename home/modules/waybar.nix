# ==========================================
#  Waybar (Home-Manager) - OnyxOSV
# ==========================================
# New users:
#   - Simple bar: workspaces, power button, clock.
#
# Advanced:
#   - Edit modules / CSS below as needed.

{ config, pkgs, lib, ... }:

{
  xdg.configFile."waybar/config".text = ''
    {
      "layer": "top",
      "position": "top",
      "height": 28,
      "margin": 0,
      "margin-top": 0,
      "margin-bottom": 0,

      "modules-left": ["workspaces"],
      "modules-center": [],
      "modules-right": ["custom/power", "clock"],

      "workspaces": {
        "format": "{name}",
        "disable-scroll": true
      },

      "clock": {
        "format": "{:%a %Y-%m-%d %H:%M}",
        "tooltip": false
      },

      "custom/power": {
        "format": "⏻",
        "tooltip": false,
        "on-click": "systemctl poweroff",
        "interval": 0
      }
    }
  '';

  xdg.configFile."waybar/style.css".text = ''
    * {
      font-family: "Hack", "monospace";
      font-size: 11pt;
      border: none;
    }

    window#waybar {
      background: transparent;
      color: #e5e5e5;
    }

    #workspaces button {
      padding: 0 6px;
      margin: 0 2px;
      background: rgba(0, 0, 0, 0.35);
      border-radius: 6px;
    }

    #workspaces button.focused {
      background: rgba(255, 255, 255, 0.15);
    }

    #clock,
    #custom-power {
      padding: 0 10px;
      margin: 0 4px;
      background: rgba(0, 0, 0, 0.35);
      border-radius: 6px;
    }

    #custom-power {
      font-weight: bold;
    }
  '';
}
