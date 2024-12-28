{
  config,
  pkgs,
  ...
}: {
  # network manager
  networking.networkmanager.enable = true;

  # firewall
  networking.firewall.enable = true;

  # vpn
  #services.zerotierone = {
  #  package = pkgs.zerotierone;
  #  enable = true;
  #  joinNetworks = ["17d709436cb399c4"];
  #  localConf = {};
  #};
}
