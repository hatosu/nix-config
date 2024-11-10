{ lib, config, pkgs, inputs, ... }: {

  nix = let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs; in { settings = {

      experimental-features = [ "nix-command" "flakes" ];

      flake-registry = "";

      nix-path = config.nix.nixPath;

      trusted-substituters = [ "https://cache.nixos.org" ];

      download-buffer-size = "99999999";

      trusted-users = [ "root" "@wheel" ];
    
    };

    gc = {
      dates = "daily";
      options = "--delete-older-than 1d";
      automatic = true;
    };

    optimise = {
      dates = [ "daily" ];
      automatic = true;
    };

    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

    channel.enable = false;

  };

  nixpkgs.config = { allowUnfree = true; allowBroken = true; };

  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  system.activationScripts.channel-remove.text = '' 
    if [ -d "/root/.nix-defexpr/channels" ] 
    then
      rm -rf /root/.nix-defexpr/channels
      mv -f /nix/var/nix/profiles/per-user/root/channels /tmp
    else
      printf ""
    fi
  '';

  boot.loader.systemd-boot.configurationLimit = 100;

}
