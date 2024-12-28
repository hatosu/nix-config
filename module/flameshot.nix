{
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.hatosu.services.flameshot = {
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
