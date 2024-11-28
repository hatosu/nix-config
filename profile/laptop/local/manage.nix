{ lib, config, pkgs, inputs, ... }: let

FLAKE = "/home/hatosu/files/config";

HOST = "laptop";

in { nix = let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs; in { settings = {

    # enable experimental features
    experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];

    # disable global registry
    flake-registry = "";

    # workaround for https://github.com/NixOS/nix/issues/9574
    nix-path = config.nix.nixPath;

    # custom binary cache
    trusted-substituters = [ "https://cache.nixos.org" ];
    extra-trusted-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    # increase buffer size
    download-buffer-size = "99999999";

    # add trusted groups
    trusted-users = [
      "root"
      "@wheel"
    ];

  };

    # auto-collect nix garbage
    gc = {
      dates = "daily";
      options = "--delete-older-than 1d";
      automatic = true;
    };

  # auto-optimize /nix/store
    optimise = {
      dates = [ "daily" ];
      automatic = true;
    };

    # make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

    # disable channels
    channel.enable = false;

    # use latest nix version
    package = pkgs.nixVersions.latest;

  };

  nixpkgs.config = {

    # allow unfree/broken packages
    allowUnfree = true;
    allowBroken = true;

    # whitelist insecure packages
    permittedInsecurePackages = [
      #"python-2.7.18.8"
    ];

  };

  # let all nix-commands use unfree packages
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  # remove unneeded channel directories
  system.activationScripts.channel-remove.text = ''
    if [ -d "/root/.nix-defexpr/channels" ] 
    then
      rm -rf /root/.nix-defexpr/channels
      mv -f /nix/var/nix/profiles/per-user/root/channels /tmp
    else
      printf ""
    fi
  '';

  # limit number of nix generations to 1000
  boot.loader.systemd-boot.configurationLimit = 1000;

  # nixhelper/aliases
  programs.nh = { enable = true; package = pkgs.pinned.nh; };
  environment.shellAliases = {
    rebuild = "sudo clear && nh os switch -H ${HOST} ${FLAKE}";
    update = "sudo nix flake update --flake ${FLAKE}";
    repair = "sudo nix-store --verify --check-contents --repair";
    purify = "sudo nix-collect-garbage && sudo nix store optimise";
  };

}
