{pkgs,lib,inputs,... }:{

  # enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # enable proprietary & broken packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  # auto-collect garbage older than 1d
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 1d";
  };

  # limit number of generations to 100
  boot.loader.systemd-boot.configurationLimit = 100;

  # auto-optimize store once per day
  nix.optimise = {
    automatic = true;
    dates = [ "daily" ];
  };

}
