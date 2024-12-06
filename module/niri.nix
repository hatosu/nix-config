{
  pkgs,
  inputs,
  strings,
  ...
}:
{

  # enable
  programs.niri = {
    package = pkgs.latest.niri;
    enable = true;
  };

  # login
  services.displayManager.ly.enable = true;

  # xdg/dbus
  services.dbus.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  # polkit
  systemd.user = {
    services = {
      polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };

  # icons
  environment.systemPackages = with pkgs; [
    pinned.adwaita-icon-theme
    pinned.papirus-icon-theme
  ];

  # bar
  home-manager.users.hatosu.programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        output = [ "*" ];
        layer = "top";
        position = "bottom";
        margin = "5px";
        height = 32;
        modules-left = [
          "niri/workspaces"
          "niri/language"
          "user"
        ];
        modules-center = [
          "niri/window"
          "privacy"
        ];
        modules-right = [
          "tray"
          "cpu"
          "temperature"
          "memory"
          "disk"
          "clock"
        ];
      };
    };
    style = strings.waybarstylecss;
  };

  # config
  home-manager.users.hatosu.home.file."niri-config" =
    let
      config = pkgs.writeText "config.kdl" ''

            //////////
            //output//
            //////////
            output "HDMI-A-1" {
                mode "2560x1080@165.000"
                scale 1.0
                variable-refresh-rate on-demand=true
            }

            ///////////
            //startup//
            ///////////
            spawn-at-startup "${pkgs.ags}/bin/ags"
            spawn-at-startup "${pkgs.nixpaper}/bin/nixpaper"
            spawn-at-startup "wl-paste" "--watch" "cliphist" "store"
            spawn-at-startup "fcitx5" "--enable" "all"
            spawn-at-startup "waybar"
            spawn-at-startup "steam" "-silent"
            spawn-at-startup "firefox"
            spawn-at-startup "vesktop" "--enable-features=UseOzonePlatform" "--ozone-platform=wayland" "--enable-wayland-ime"
            spawn-at-startup "spotify"

            /////////
            //input//
            /////////
            input {
                keyboard {
                    xkb {
                        layout "us"
                    }
                }
                touchpad {
                    off
                }
                mouse {
                    accel-profile "flat"
                    scroll-method "no-scroll"
                }
                focus-follows-mouse max-scroll-amount="0%"
            }
            
            /////////
            //binds//
            /////////
            binds {
                XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
                XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
                XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
                XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
                Mod+T { spawn "rofi" "-show" "drun"; }
                Mod+C { spawn "cliphist" "list" "|" "${pkgs.fuzzel}/bin/fuzzel" "-d" "|" "cliphist" "decode" "|" "wl-copy"; }
                Mod+L { spawn "foot"; }
                Mod+B { spawn "firefox"; }
                Mod+H { spawn "flameshot" "gui"; }
                Mod+O { spawn "nixocr"; }
                Mod+P { spawn "${pkgs.hyprpicker}/bin/hyprpicker" "-a"; }
                Mod+N { spawn "playerctl" "play-pause"; }
                Mod+M { spawn "playerctl" "next"; }
                Mod+Z { close-window; }
                Mod+A     { focus-column-left; }
                Mod+S     { focus-window-down; }
                Mod+D     { focus-window-up; }
                Mod+F     { focus-column-right; }
                Mod+Shift+A     { move-column-left; }
                Mod+Shift+S     { move-window-down; }
                Mod+Shift+D     { move-window-up; }
                Mod+Shift+F     { move-column-right; }
                Mod+Shift+Q { move-column-to-first; }
                Mod+Shift+R  { move-column-to-last; }
                Mod+1 { focus-workspace 1; }
                Mod+2 { focus-workspace 2; }
                Mod+3 { focus-workspace 3; }
                Mod+4 { focus-workspace 4; }
                Mod+5 { focus-workspace 5; }
                Mod+6 { focus-workspace 6; }
                Mod+7 { focus-workspace 7; }
                Mod+8 { focus-workspace 8; }
                Mod+9 { focus-workspace 9; }
                Mod+Shift+1 { move-window-to-workspace 1; }
                Mod+Shift+2 { move-window-to-workspace 2; }
                Mod+Shift+3 { move-window-to-workspace 3; }
                Mod+Shift+4 { move-window-to-workspace 4; }
                Mod+Shift+5 { move-window-to-workspace 5; }
                Mod+Shift+6 { move-window-to-workspace 6; }
                Mod+Shift+7 { move-window-to-workspace 7; }
                Mod+Shift+8 { move-window-to-workspace 8; }
                Mod+Shift+9 { move-window-to-workspace 9; }
                Mod+BracketLeft  { consume-or-expel-window-left; }
                Mod+BracketRight { consume-or-expel-window-right; }
                Mod+Ctrl+M { maximize-column; }
                Mod+Ctrl+F { fullscreen-window; }
                Mod+C { center-column; }
                Mod+Q { set-column-width "-10%"; }
                Mod+R { set-column-width "+10%"; }
                Mod+W { set-window-height "-10%"; }
                Mod+E { set-window-height "+10%"; }
                Mod+Shift+X { quit; }
            }
            
            //////////
            //layout//
            //////////
            layout {
                gaps 20
                preset-column-widths {
                    proportion 0.5
                    proportion 0.5
                    proportion 0.5
                }
                default-column-width { proportion 0.5; }
                focus-ring {
        	          width 0.1
                    active-color "#31324400"
        	          inactive-color "#31324400"
                    active-gradient from="#80c8ff" to="#bbddff" angle=45
                    inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
                }
                border {
                    width 2
                    active-color "#313244FF"
                    inactive-color "#1e1e2eFF"
                    active-gradient from="#ffbb66" to="#ffc880" angle=45 relative-to="workspace-view"
                    inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
                }
                struts {
                    left 15
                    right 15
                }
            }
            
            /////////
            //rules//
            /////////
            window-rule {
                opacity 0.98
                geometry-corner-radius 6
                clip-to-geometry true
            }
            window-rule {
                match app-id="^foot$"
                min-width 600
                max-width 2560
                min-height 1000
                max-height 1080
            }
            
            ////////
            //misc//
            ////////
            prefer-no-csd
            
            ////////
            //xorg//
            ////////
            spawn-at-startup "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ":0"
            environment {
                DISPLAY ":0"
            }
          
      '';
    in
    {
      source = config;
      target = ".config/niri/config.kdl";
      force = true;
    };

}
