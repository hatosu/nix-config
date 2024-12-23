{ nixosVersion, ... }: {

  # reload ALL system units when changing configs
  systemd.user.startServices = "sd-switch";

  # hm
  programs.home-manager.enable = true;
  home.username = "hatosu";
  home.homeDirectory = "/home/hatosu";

  # version
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = nixosVersion;

}
