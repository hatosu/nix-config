{ inputs
, lib
, config
, pkgs
, strings
, vars
, nixosVersion
, ...
}: {
  # reload ALL system units when changing configs
  systemd.user.startServices = "sd-switch";

  # hm
  home.username = "hatosu";
  home.homeDirectory = "/home/hatosu";
  programs.home-manager.enable = true;

  # version
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = nixosVersion;
}
