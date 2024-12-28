{ ... }: {

  users.users.hatosu = {
    isNormalUser = true;
    home = "/home/hatosu";
    initialPassword = ";";
    group = "users";
    extraGroups = [ "wheel" ];
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  time.timeZone = "America/Los_Angeles";

}