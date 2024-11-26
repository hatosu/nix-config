{
  pkgs,
  inputs,
  lib,
  ...
}:
{

  services = {

    # enable xorg
    xserver = {
      enable = true;

      # enable gnome
      desktopManager.gnome = {
        enable = true;
      };

      # enable gdm
      displayManager.gdm = {
        enable = true;
      };

      # exclude default xorg packages
      excludePackages = with pkgs; [ xterm ];

    };

    # gnome services
    gnome = {
      core-utilities.enable = false;
      evolution-data-server.enable = lib.mkForce false; # Disable Events and Tasks Reminders from always running in the background
      sushi.enable = true; # Nautilus previewing
    };

  };

  # icons
  environment.systemPackages =
    with pkgs;
    [
      pinned.adwaita-icon-theme
      pinned.papirus-icon-theme
    ]

    # extensions
    ++ (with pkgs.gnomeExtensions; [
      appindicator
      blur-my-shell
      pop-shell
    ]);

  # configure dconf
  home-manager.users.hatosu.dconf.settings = {

    # general
    "org/gnome/shell" = {
      favorite-apps = [
        # taskbar apps
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "kitty.desktop"
        #"code.desktop"
        "obsidian.desktop"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-format = "12h";
      clock-show-weekday = true; # Show day of the week on top bar
      clock-show-date = false; # Don't show the date
      enable-hot-corners = false;
      font-antialiasing = "rgba"; # Aliasing with lcd screen instead of grayscale
    };
    "org/gnome/settings-daemon/plugins/power" = {
      ambient-enabled = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 1;
      button-layout = "appmenu:minimize,close"; # Show minimize and close button for windows
      action-right-click-titlebar = "toggle-shade";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/privacy" = {
      remove-old-temp-files = true;
      recent-files-max-age = 30;
      remove-old-trash-files = true;
      old-files-age = 30;
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat"; # No mouse acceleration
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      accel-profile = "flat";
      disable-while-typing = false;
    };
    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };

    # keybinds
    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [ ]; # Never reset shortcuts to default
    };
    "org/gnome/shell/keybindings" = {
      toggle-application-view = [ "<Super>a" ];
      toggle-quick-settings = [ "<Super>s" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ "<Super>Tab" ]; # Legacy alt-tab menu
      switch-applications-backward = [ "<Shift><Super>Tab" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
      toggle-fullscreen = [ "<Control><Super>f" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      screenreader = [ ];
      home = [ "<Super>e" ]; # Open file explorer
      www = [ "<Super>b" ]; # Open web browser
      control-center = [ "<Super>i" ]; # Open settings
      search = [ "<Super>space" ];
      logout = [ "<Control><Super>y" ]; # Power off
    };

    # nautilus
    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };
    "org/gtk/settings/file-chooser" = {
      show-hidden = true;
    };

  };

  # exclude default gnome packages
  environment.gnome.excludePackages = with pkgs; [
    orca
    evince
    file-roller
    geary
    gnome-disk-utility
    seahorse
    gnome-backgrounds
    gnome-tour # GNOME Shell detects the .desktop file on first log-in.
    gnome-user-docs
    baobab
    epiphany
    gnome-text-editor
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-console
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-weather
    gnome-connections
    simple-scan
    snapshot
    totem
    yelp
    gnome-software
    #sushi
    #sysprof
    #gnome-shell-extensions
    #nixos-background-info
    #gnome-bluetooth
    #gnome-color-manager
    #gnome-control-center
    #gnome-shell-extensions
    #glib #for gsettings program
    #gnome-menus
    #gtk3.out #for gtk-launch program
    #xdg-user-dirs #Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
    #xdg-user-dirs-gtk #Used to create the default bookmarks
    #gnome-clocks
    #gnome-system-monitor
    #loupe
    #nautilus
  ];

}
