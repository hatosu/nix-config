{ pkgs, inputs, ... }: { wayland.windowManager.hyprland = { 

  enable = true;

  package = pkgs.fresh.hyprland;

  xwayland.enable = true;
  
  sourceFirst = true;
  
  systemd = {
    enable = true;
    enableXdgAutostart = false;
    #variables = [ "--all" ];
  };

  extraConfig = let

  display = ''
    monitor = HDMI-A-1,2560x1080@165,auto,auto
    monitor = eDP-1, disable
  '';

  exec = ''
    exec-once = ${pkgs.ags}/bin/ags
    exec-once = ${pkgs.nixpaper}/bin/nixpaper
    exec-once = wl-paste --watch cliphist store  
    exec-once = waybar
    exec-once = fcitx5 --enable all
    exec-once = steam -silent
    exec-once = [workspace 1 silent] firefox
    exec-once = [workspace 2 silent] foot
    exec-once = [workspace 3 silent] vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime
    exec-once = [workspace 4 silent] spotify
  '';

  rules = ''
    windowrulev2 = opacity 0.90 0.90,floating:0
    windowrulev2 = opacity 0.90 0.90,floating:1
    windowrulev2 = suppressevent maximize, class:.*
    windowrule = workspace 3, title:^(.*Discord.*)$
    windowrule = workspace 4, title:^(.*Spotify.*)$
  '';

  vars = ''
    env = XDG_CURRENT_DESKTOP,Hyprland
    env = XDG_SESSION_DESKTOP,Hyprland
    env = XDG_SESSION_TYPE,wayland
    env = NIXOS_OZONE_WL,1
    env = LIBVA_DRIVER_NAME,nvidia
    env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    env = NVD_BACKEND,direct
    env = GDK_BACKEND,wayland,x11
    env = CLUTTER_BACKEND,wayland
    env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
    env = SDL_VIDEODRIVER,windows,x11
    env = MOZ_ENABLE_WAYLAND,1
    env = QT_QPA_PLATFORM,wayland;xcb
    env = USE_WAYLAND_GRIM,1
  '';

  input = ''
    input {
      kb_layout = us
      follow_mouse = 1
      touchpad {
        natural_scroll = no
      }
      sensitivity = 0
      force_no_accel = 1
    }
  '';

  visual = ''
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
  '';

  animation = ''
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
    dwindle {
      pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true # You probably want this
    }
  '';

  other = ''
    cursor { 
      no_hardware_cursors = true
    }
    misc {
      enable_swallow = true
      swallow_regex = ^(Kitty|foot|footclient)$
    }
    master {
        new_status = master
    }
  '';

  binds = ''
    $mainMod = SUPER
    bind = $mainMod, T, exec, rofi -show drun
    bind = $mainMod, C, exec, cliphist list | ${pkgs.fuzzel}/bin/fuzzel -d | cliphist decode | wl-copy
    bind = $mainMod, L, exec, foot
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
  '';

in"${display}\n${vars}\n${exec}\n${rules}\n${input}\n${visual}\n${animation}\n${other}\n${binds}";};}
