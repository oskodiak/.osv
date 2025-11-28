{ config, pkgs, lib, ... }:

{
  xdg.configFile."niri/config.kdl".text = ''
    // OnyxOSV Niri config - managed by Home-Manager
    // Do NOT edit ~/.config/niri/config.kdl directly.

    // ─────────────────────────────────────────
    //  Layout / appearance
    // ─────────────────────────────────────────
    layout {
        // Gaps around windows in logical pixels
        gaps 12

        // Dark neutral background (no wallpaper)
        background-color "#101010"

        // Focus ring so you can see where you are
        focus-ring {
            width 4
            active-color "#7fc8ff"
            inactive-color "#505050"
        }
    }

    // ─────────────────────────────────────────
    //  Startup applications
    // ─────────────────────────────────────────
    //
    // Start Waybar when Niri starts.
    spawn-at-startup "waybar"

    // ─────────────────────────────────────────
    //  Keybinds
    // ─────────────────────────────────────────
    binds {
        // --- Launchers ---------------------------------

        // Super+Enter → Ghostty terminal
        Mod+Return hotkey-overlay-title="Open terminal (Ghostty)" {
            spawn "ghostty";
        }

        // Super+D → fuzzel launcher
        Mod+D hotkey-overlay-title="Application launcher (Fuzzel)" {
            spawn "fuzzel";
        }

        // Super+Alt+L → lock screen (swaylock)
        // (Make sure swaylock is installed & PAM is set; see Nix config)
        Mod+Alt+L hotkey-overlay-title="Lock screen" {
            spawn "swaylock";
        }

        // --- Basic window control ----------------------

        // Close focused window
        Mod+Q hotkey-overlay-title="Close window" {
            close-window;
        }

        // Fullscreen toggle for focused window
        Mod+F {
            fullscreen-window;
        }

        // --- Focus movement (HJKL + arrows) ------------

        Mod+H { focus-column-left; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }

        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }

        // --- Move windows/columns ----------------------

        Mod+Ctrl+H { move-column-left; }
        Mod+Ctrl+J { move-window-down; }
        Mod+Ctrl+K { move-window-up; }
        Mod+Ctrl+L { move-column-right; }

        // --- Workspaces 1–9 ---------------------------

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }
    }
  '';
}
