{ pkgs, ... }: {

  services = {

    displayManager.defaultSession = "plasmax11";

    xserver = {
      enable = true;
      excludePackages = with pkgs; [ xterm ];
      displayManager.setupCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr \
        --output HDMI-A-1 --primary --mode 2560x1080 --rate 165 --pos 0x0 --rotate normal
      '';
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = false;
    };

    desktopManager.plasma6 = {
      enable = true;
    };
  
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    khelpcenter
    oxygen
  ];

  home-manager.users.hatosu.programs.plasma = {
    enable = true;
    
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Papirus-Dark";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 32;
      };
    };
    
    fonts = {
      general = {
        family = "JetBrains Mono";
        pointSize = 12;
      };
    };

    desktop.widgets = [
    ];

    hotkeys.commands = {
      "kitty" = { name = "kitty"; command = "kitty"; key = "Meta+L"; };
    };

    shortcuts = {
      kwin = {
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";
        "Switch to Desktop 7" = "Meta+7";
        "Switch to Desktop 8" = "Meta+8";
        "Switch to Desktop 9" = "Meta+9";
        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";
        "Window to Desktop 6" = "Meta+^";
        "Window to Desktop 7" = "Meta+&";
        "Window to Desktop 8" = "Meta+*";
        "Window to Desktop 9" = "Meta+(";
      };
    };

    # bar (as opposed to waybar)
    panels = [
      {
        location = "bottom";
        floating = true;
        widgets = [
          {
            kickoff = {
              icon = "nix-snowflake-white";
            };
          }
          "org.kde.plasma.pager"
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:firefox-esr.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];

    configFile = {
      kwinrc = {
        Desktops = {
          Number = {
            value = 9;
            immutable = true;
          };
          Rows = {
            value = 3;
            immutable = true;
          };
        };
      };

      plasmaashellrc = {
        PlasmaViews = {
          panelOpacity = 2;
        };
      };

      kxkbrc = {
        Layout = {
          LayoutList = "gb";
          Use = true;
        };
      };
    };

    powerdevil = {
      AC = {
        autoSuspend.action = "nothing";
        dimDisplay.enable = false;
        powerButtonAction = "hibernate";
      };
    };

  };

}
