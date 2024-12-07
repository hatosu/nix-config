{ inputs
, vars
, ...
}: {
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
  i18n.defaultLocale = "en_US.UTF-8";

  # tty
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # timezone
  time.timeZone = "America/Los_Angeles";
}
