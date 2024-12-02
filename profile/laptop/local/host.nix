{ inputs, vars, ... }: {

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

  # locale
  i18n.defaultLocale = vars.locale;
  home-manager.users.hatosu.home.language = {
    base = vars.locale;
    ctype = vars.locale;
    numeric = vars.locale;
    time = vars.locale;
    collate = vars.locale;
    monetary = vars.locale;
    messages = vars.locale;
    paper = vars.locale;
    name = vars.locale;
    address = vars.locale;
    telephone = vars.locale;
    measurement = vars.locale;
  };

  # tty
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # timezone
  time.timeZone = "America/Los_Angeles";

}
