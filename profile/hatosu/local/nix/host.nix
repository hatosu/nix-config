{ ... }: {

  # define hostname
  networking.hostName = "nixos";

  # setup hatosu as user
  users.users.hatosu = {
    isNormalUser = true;
    home = "/home/hatosu";
    description = "Hatosu's NixOS user.";
    initialPassword = ";";
    group = "users";
    extraGroups = [ 
      "wheel"
      "audio"
      "sound"
      "video"
      "networkmanager"
      "input"
      "tty"
      "docker"
      "libvirtd" 
      "kvm"
    ];
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

}
