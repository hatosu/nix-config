{ pkgs, strings, ... }: {

  imports = [
    ./hardware.nix
    ./disk.nix
    ./impermanence.nix
    ./manage.nix
    ./network.nix
    ./webfish.nix
  ];

  users.users.server1 = {
    isNormalUser = true;
    home = "/home/server1";
    initialPassword = ";";
    group = "users";
    extraGroups = [ "wheel" ];
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services.picom.enable = true;
  services.xserver.windowManager.i3 = {
    enable = true;
    configFile = strings.i3config;
  };

  programs.steam.enable = true;

  fonts.packages = with pkgs; [ noto-fonts hack-font gohufont ];

  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;

  kernelPackages = pkgs.linuxPackages;
  
  networking.hostName = "nix";
  
  time.timeZone = "America/Los_Angeles";
  
  environment.systemPackages = with pkgs; [ vim git kitty firefox rofi ];

  system.stateVersion = "23.11";

}
