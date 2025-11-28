# ==========================================
#  Niri (Home-Manager) - OnyxOSV
# ==========================================
# New users:
#   - This defines how Niri behaves for this user.
#
# Advanced:
#   - Edit keybindings, layouts, and startup apps here.

{ config, pkgs, lib, ... }:

let
  terminal = "ghostty";
  mod = "Super";
in
{
  xdg.configFile."niri/config.kdl".text = ''
    # Basic Niri config for OnyxOSV

    monitor {
      name "*"
      scale 1.0
    }

    binding {
      modifier ${mod}
      key "Return"
      action spawn "${terminal}"
    }

    binding {
      modifier ${mod}
      key "Q"
      action close-window
    }

    binding {
      modifier ${mod}
      key "E"
      action spawn "fuzzel"
    }

    binding {
      modifier ${mod}
      key "R"
      action reload-config
    }

    binding {
      modifier ${mod}
      key "F"
      action fullscreen
    }

    binding {
      modifier ${mod}
      key "1"
      action focus-workspace 1
    }

    binding {
      modifier ${mod}
      key "2"
      action focus-workspace 2
    }

    binding {
      modifier ${mod}
      key "3"
      action focus-workspace 3
    }

    # You can extend this with more bindings and layout rules later.
  '';
}
