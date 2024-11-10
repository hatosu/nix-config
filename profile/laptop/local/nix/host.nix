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
      "docker"
      "libvirtd" 
      "kvm"
    ];
  };

  # properly set default locale
  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    supportedLocales = ["ja_JP.UTF-8/UTF-8"];
  };

  # tty
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # timezone
  time.timeZone = "America/Los_Angeles";

}
