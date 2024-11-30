{ pkgs, ... }: {

  # enable sddm & plasma6
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # use xorg
  services.xserver.displayManager.defaultSession = "plasmax11";
  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = false;

  # exclude packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
  ];
  
}
