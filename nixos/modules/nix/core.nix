{pkgs,lib,config,inputs,...}:{

  # choose custom linux kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # setup bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # define hostname
  networking.hostName = "nixos";

  # setup hatosu as user
  users.users.hatosu = {
    isNormalUser = true;
    home = "/home/hatosu";
    description = "guh... mlem -hatosu";
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

  # setup network manager
  networking.networkmanager.enable = true;

  # setup firewall
  networking.firewall.enable = true;

  # set zsh as default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # fuse
  programs.fuse.userAllowOther = true;

}
