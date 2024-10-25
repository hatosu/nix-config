{ description = "Hatosu's NixOS flake.";

  inputs = {

    # unstable (newest packages)
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # fresh (upcycle packages)
    nixpkgs-fresh.url = "github:nixos/nixpkgs/nixos-unstable";

    # stable (old packages)
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

    # files
    personal-files = {
      url = "github:hatosu/personal-files";
      flake = false;
    };

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager/038630363e7de57c36c417fd2f5d7c14773403e4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hisko
    disko = {
      url = "github:nix-community/disko/67dc29be3036cc888f0b9d4f0a788ee0f6768700";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # firefox-addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons&ref=610a9c92c573bf57959ffd371cb4921dd681b272";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # aagl
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/5611dd61df02e0bc5d62bb3f5388821d8854faff";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix/1a8fa34b656d67c1d7d4c2b76cba03bf4d65dee4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # impermanence
    impermanence = {
      url = "github:nix-community/impermanence/fff0d95cf40609941769a443a001b25fb95b68ab";
    };

    # nixos-hardware
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/5c04dd453beb0244a686d7c543e97aed71a20258";
    };

    # nix-gaming
    nix-gaming = {
      url = "github:fufexan/nix-gaming/d5baae772ce87682c624233c7a9265b387caa818";
    };

  };

  # add custom binary cache (list from least to most likely to fail & only use extra-substituters)
  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
    ];
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  # list outputs
  outputs = {
    self,
    nixpkgs,
    personal-files,
    home-manager,
    nixos-hardware,
    aagl,
    ...
  } @ inputs: let

    # define various variables ^_^
    systems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs systems; in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
    overlays = import ./overlay {inherit inputs;};
    nixosModules = import ./module/nix;
    homeManagerModules = import ./module/home;
    nixosConfigurations = {

      # desktop profile
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./profile/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.spicetify-nix.nixosModules.default
          aagl.nixosModules.default
          (import ./profile/desktop/disk.nix{device="/dev/disk/by-uuid/mNEOP4-MgMU-6wSu-9om0-XYh6-jrZD-iRuLX7";})
        ];
      };

      # laptop profile
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          nixos-hardware.nixosModules.asus-zephyrus-ga402x-nvidia
          (import ./profiles/laptop/disko.nix{device="/dev/nvme0n1";})
        ];
      };

      # minecraft server
      minecraft = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
          nixos-hardware.nixosModules.something
          inputs.disko.nixosModules.default
          (import ./profiles/laptop/disko.nix{device="/dev/sda";})
        ];
      };

      # temp profile
      temp = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
          inputs.disko.nixosModules.default
          (import ./profiles/temp/disko.nix{device="/dev/sda";})
        ];
      };

    };
  };
}
