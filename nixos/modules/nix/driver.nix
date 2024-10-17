{pkgs,lib,config,... }:{

  # sound
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {
            main."monitor.libcamera" = "disabled";
          };
        };
      };
    };
  };

  # xdg/dbus/polkit
  services.dbus.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
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

}
