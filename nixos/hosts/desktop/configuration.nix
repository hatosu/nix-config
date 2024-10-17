{ inputs, lib, config, pkgs, ... }: {

  imports = [

    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.self.nixosModules.desktop
    inputs.self.nixosModules.core
    inputs.self.nixosModules.driver
    inputs.self.nixosModules.font
    inputs.self.nixosModules.game
    inputs.self.nixosModules.manage
    inputs.self.nixosModules.package
    inputs.self.nixosModules.secure
    inputs.self.nixosModules.variable
    inputs.self.nixosModules.virtualization
    inputs.self.nixosModules.login
    inputs.self.nixosModules.keyboard
    inputs.self.nixosModules.init
    inputs.self.nixosModules.alias
    inputs.self.nixosModules.function
    inputs.self.nixosModules.find
    inputs.self.nixosModules.rebuild
    inputs.self.nixosModules.help
    inputs.self.nixosModules.wallpaper
    inputs.self.nixosModules.impermanence

  ];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {

      # Opinionated: disable global registry
      flake-registry = "";

      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    
    };

    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

  };

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "hatosu" = import ./home.nix;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
