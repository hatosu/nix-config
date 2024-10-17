{ pkgs, ...}: let
niri-config = pkgs.writeText "config.kdl" ''

///////////
//startup//
///////////
spawn-at-startup "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ":0"
spawn-at-startup "wallpaper"
spawn-at-startup "dunst"
spawn-at-startup "fcitx5"
spawn-at-startup "${pkgs.vesktop}/bin/vesktop" "--enable-features=UseOzonePlatform" "--ozone-platform=x11" "--enable-wayland-ime"

//////////
//output//
//////////
output "HDMI-A-1" {
    mode "2560x1080@165.000"
    scale 1.0
    variable-refresh-rate on-demand=true
}

/////////////
//variables//
/////////////
environment {
    DISPLAY ":0"
    EDITOR "nvim"
    BROWSER "firefox"
    TERMINAL "foot"
    XDG_SESSION_DESKTOP "niri"
    XDG_CURRENT_DESKTOP "niri"
}

/////////
//binds//
/////////
binds {
    XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
    XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
    XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
    XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
    Mod+N { spawn "playerctl" "play-pause"; }
    Mod+M { spawn "playerctl" "next"; }
    Mod+L { spawn "foot"; }
    Mod+T { spawn "fuzzel"; }
    Mod+B { spawn "firefox"; }
    Mod+O { spawn "${pkgs.hyprpicker}/bin/hyprpicker" "-a"; }
    Mod+H { spawn "flameshot" "gui"; }
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
    Mod+Ctrl+R { reset-window-height; }
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
    struts {
        left 15
        right 15
    }
    focus-ring {
       off
    }
    border {
       off
    }
}

/////////
//rules//
/////////
window-rule {
    opacity 0.98
    geometry-corner-radius 7
    clip-to-geometry true
}
window-rule {
    match app-id="foot"
    open-maximized false
    min-width 600
    max-width 2560
    min-height 1000
    max-height 1080
}
window-rule {
    match app-id="ripdrag"
    min-width 350
    max-width 350
    min-height 1000
    max-height 1080
}

////////
//misc//
////////
prefer-no-csd

/////////
//input//
/////////
input {
    warp-mouse-to-focus
    focus-follows-mouse max-scroll-amount="0%"
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
}

''; in { home.file = { "niri-config" = { source = niri-config;
target = ".config/niri/config.kdl"; force = true; }; }; } 
