{ pkgs, inputs, ... }: {

  services.flameshot = {
    package = pkgs.pinned.flameshot;
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
      };
    };
  };

}
