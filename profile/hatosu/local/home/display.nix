{ pkgs, ...}: { 

# hyprland
wayland.windowManager.hyprland = { package = pkgs.hyprland;
enable = true; xwayland.enable = true; systemd.enable = true; extraConfig = ''
monitor = HDMI-A-1,2560x1080@165,auto,auto
monitor = eDP-1, disable
env = __NV_PRIME_RENDER_OFFLOAD,1
env = LIBVA_DRIVER_NAME,nvidia
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = __GL_GSYNC_ALLOWED,1
env = __GL_VRR_ALLOWED,1
env = WLR_DRM_NO_ATOMIC=1
env = __VK_LAYER_NV_optimus,NVIDIA_only
env = NVD_BACKEND,direct
env = WLR_RENDERER_ALLOW_SOFTWARE,1
env = QT_AUTO_SCREEN_SCALE_FACTOR,1
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = QT_QPA_PLATFORMTHEME,qt5ct
env = __GL_MaxFramesAllowed,1
env = WLR_NO_HARDWARE_CURSORS,1
env = XDG_SESSION_DESKTOP,Hyprland
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_TYPE,wayland
env = GDK_BACKEND,wayland,x11
env = SDL_VIDEODRIVER,wayland 
env = CLUTTER_BACKEND,wayland
env = QT_QPA_PLATFORM,wayland # "wayland;xcb"
xwayland { 
  force_zero_scaling = true 
}
cursor { 
  no_hardware_cursors = true
}
exec-once = ${pkgs.dunst}/bin/dunst
exec-once = ${pkgs.wallpaper}/bin/wallpaper
exec-once = waybar
exec-once = fcitx5 --enable all
exec-once = [workspace 1 silent] firefox
exec-once = [workspace 2 silent] foot
exec-once = [workspace 3 silent] vesktop --enable-features=UseOzonePlatform --ozone-platform=x11 --enable-wayland-ime
exec-once = [workspace 4 silent] spotify
input {
    kb_layout = us
    follow_mouse = 1
    touchpad {
        natural_scroll = no
    }
    sensitivity = 0
    force_no_accel = 1
}
windowrulev2 = opacity 0.90 0.90,floating:0
windowrulev2 = opacity 0.90 0.90,floating:1
decoration {
    rounding = 7
    blur { 
        enabled = true
        size = 4
        passes = 2
        ignore_opacity = true
    }
}
general { 
    gaps_in = 9
    gaps_out = 11
    border_size = 1
    col.active_border = rgba(f78f88d9) rgba(f5c0bcd9) rgba(ceeaf0d9)
    col.inactive_border = rgba(595959aa)
    resize_on_border = false 
    allow_tearing = false
    layout = dwindle
}
dwindle {
    pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # You probably want this
}
master {
    new_status = master
}
animations {
  enabled = true
  bezier = overshot, 0.05, 0.9, 0.1, 1.05
  bezier = smoothOut, 0.36, 0, 0.66, -0.56
  bezier = smoothIn, 0.25, 1, 0.5, 1
  animation = windows, 1, 3, overshot, slide
  animation = windowsOut, 1, 3, smoothOut, slide
  animation = windowsMove, 1, 3, default
  animation = border, 1, 3, default
  animation = fade, 1, 3, smoothIn
  animation = fadeDim, 1, 3, smoothIn
  animation = workspaces, 1, 3, default, fade
}
windowrule = workspace 3, title:^(.*Discord.*)$
windowrule = workspace 4, title:^(.*Spotify.*)$
windowrulev2 = suppressevent maximize, class:.*
$PiP = class:^(firefox)$, title:^(Firefox|Picture-in-Picture)$
misc {
  enable_swallow = true
  swallow_regex = ^(Kitty|foot|footclient)$
}
$mainMod = SUPER
bind = $mainMod, L, exec, foot
bind = $mainMod, T, exec, rofi -show drun
bind = $mainMod, B, exec, firefox
bind = $mainMod, H, exec, flameshot gui
bind = $mainMod, O, exec, nixocr
bind = $mainMod, P, exec, ${pkgs.hyprpicker}/bin/hyprpicker -a
bind = $mainMod, X, togglefloating
bind = $mainMod, Z, killactive,
bind = $mainMod+Ctrl, F, fullscreen
bind = $mainMod+Ctrl, Y, exit,
bind = $mainMod, a, movefocus, l
bind = $mainMod, f, movefocus, r
bind = $mainMod, d, movefocus, u
bind = $mainMod, s, movefocus, d
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10
bind = $mainMod+Shift, 1, movetoworkspace, 1
bind = $mainMod+Shift, 2, movetoworkspace, 2
bind = $mainMod+Shift, 3, movetoworkspace, 3
bind = $mainMod+Shift, 4, movetoworkspace, 4
bind = $mainMod+Shift, 5, movetoworkspace, 5
bind = $mainMod+Shift, 6, movetoworkspace, 6
bind = $mainMod+Shift, 7, movetoworkspace, 7
bind = $mainMod+Shift, 8, movetoworkspace, 8
bind = $mainMod+Shift, 9, movetoworkspace, 9
bind = $mainMod+Shift, 0, movetoworkspace, 10
binde = $mainMod, r, resizeactive, 110 0
binde = $mainMod, q, resizeactive, -110 0
binde = $mainMod, e, resizeactive, 0 -50
binde = $mainMod, w, resizeactive, 0 50
bind = $mainMod+Shift, a, movewindow, l
bind = $mainMod+Shift, f, movewindow, r
bind = $mainMod+Shift, d, movewindow, u
bind = $mainMod+Shift, s, movewindow, d
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 10%+
bindel = ,XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 10%-
bindl = , XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next
bindl = , XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause
bindl = , XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause
bindl = , XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous
'';};

# river
wayland.windowManager.river = { package = pkgs.river;
enable = true; xwayland.enable = true; extraConfig = ''
dbus-launch wlr-randr --output eDP-1 --on --mode 2880x1800@60.000999 --scale 1.75 &
dbus-launch waybar &
fcitx5 &
dunst &
dbus-launch swaybg -i /etc/nixos/profiles/laptop/resources/wallpapers/wallpaper1.jpg &
mod="Mod4"
riverctl map normal $mod T spawn "fuzzel --prompt='  ' --terminal='kitty -e' --background=0b151dff --text=c6d2edff --selection-color=ac8aacff --selection-text=0b151dff --border-width=2 --border-color=404b66ff --icon-theme=Papirus-Dark --match-color=bd6b6aff --font='mononoki Nerd Font':size=12 --lines=10 --line-height=20"
riverctl map normal $mod+Shift N spawn "playerctl play-pause"
riverctl map normal $mod+Shift M spawn "playerctl next"
riverctl map normal $mod L spawn kitty
riverctl map normal $mod B spawn firefox
riverctl map normal $mod O spawn "hyprpicker -a"
riverctl map normal $mod C spawn "dbus-launch wlr-randr --output eDP-2 --on --mode 2880x1800@60.000999 --scale 1.00 && sleep 1 && dbus-launch flameshot gui && sleep 1 && dbus-launch wlr-randr --output eDP-2 --on --mode 2880x1800@60.000999 --scale 1.75"
riverctl map normal $mod V spawn "vesktop --enable-features=UseOzonePlatform --ozone-platform=x11 --enable-wayland-ime"
riverctl map normal $mod Z close
riverctl map normal $mod+Shift X exit
riverctl map-pointer normal $mod BTN_LEFT move-view
riverctl map-pointer normal $mod BTN_RIGHT resize-view
riverctl map normal $mod A resize horizontal -100
riverctl map normal $mod M resize vertical 100
riverctl map normal $mod N resize vertical -100
riverctl map normal $mod F resize horizontal 100
riverctl map normal $mod S focus-view next
riverctl map normal $mod D focus-view previous
riverctl map normal $mod+Shift S swap next
riverctl map normal $mod+Shift D swap previous
riverctl map normal $mod+Shift F toggle-fullscreen
riverctl map normal $mod X toggle-float
riverctl map normal $mod Up    send-layout-cmd rivertile "main-location top"
riverctl map normal $mod Right send-layout-cmd rivertile "main-location right"
riverctl map normal $mod Down  send-layout-cmd rivertile "main-location bottom"
riverctl map normal $mod Left  send-layout-cmd rivertile "main-location left"
riverctl border-color-focused 0xa6729f #0xac8aac #0x404B66
riverctl border-color-unfocused 0x404b66 #0x0B151D
riverctl border-width 1
riverctl default-layout rivertile
riverctl spawn "rivertile -main-ratio 0.50"
riverctl rule-add -app-id 'float*' -title 'ripdrag' float
for i in $(seq 1 6)
do
	tags=$((1 << ($i - 1)))
  riverctl map normal $mod $i set-focused-tags $tags
  riverctl map normal $mod+Shift $i set-view-tags $tags
  riverctl map normal $mod+Control $i toggle-focused-tags $tags
  riverctl map normal $mod+Shift+Control $i toggle-view-tags $tags
done
riverctl keyboard-layout us
riverctl input pointer-10248-536-ASUF1208:00_2808:0218_Touchpad tap enabled
riverctl input pointer-10248-536-ASUF1208:00_2808:0218_Touchpad drag enabled
riverctl input pointer-10248-536-ASUF1208:00_2808:0218_Touchpad disable-while-typing enabled enabled
riverctl input pointer-10248-536-ASUF1208:00_2808:0218_Touchpad middle-emulation enabled
riverctl input pointer-10248-536-ASUF1208:00_2808:0218_Touchpad natural-scroll enabled
riverctl input pointer-10248-536-ASUF1208:00_2808:0218_Touchpad tap-button-map left-right-middle
riverctl input pointer-10248-536-ASUF1208:00_2808:0218_Touchpad scroll method two-finger
riverctl focus-follows-cursor always
riverctl hide-cursor when-typing enabled
riverctl set-cursor-warp on-focus-change
riverctl set-repeat 50 300
'';};

}
