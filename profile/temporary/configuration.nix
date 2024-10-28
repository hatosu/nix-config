{ pkgs, ... }: {

  # import hardware.nix
  imports = [
    ./hardware.nix
  ];

  # configure boot-loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # enable network-manager
  networking.networkmanager.enable = true;

  # define hostname
  networking.hostName = "nixos";

  # setup hatosu as user
  users.users.hatosu = {
    isNormalUser = true;
    home = "/home/hatosu";
    description = "guh... mlem";
    extraGroups = [ "wheel" "libvirtd" "kvm" ];
    initialPassword = ";";
  };

  # properly set default locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # setup timezone
  time.timeZone = "America/Los_Angeles";

  # allow user to modify mountpoints
  programs.fuse.userAllowOther = true;

  # fetch packages
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
  ];

  # state version
  system.stateVersion = "23.05";

}
