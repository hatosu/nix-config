{

  description = "Hatosu's personal NixOS flake.";

  inputs = {

    # Unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Stable
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager/038630363e7de57c36c417fd2f5d7c14773403e4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Disko
    disko = {
      url = "github:nix-community/disko/67dc29be3036cc888f0b9d4f0a788ee0f6768700";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Firefox-addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons&ref=610a9c92c573bf57959ffd371cb4921dd681b272";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri
    niri = {
      url = "github:sodiboo/niri-flake/1c8928cad2c890e77d2b7963366ce4a2c610311c";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Impermanence
    impermanence = {
      url = "github:nix-community/impermanence/fff0d95cf40609941769a443a001b25fb95b68ab";
    };

    # Nixos-hardware
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/5c04dd453beb0244a686d7c543e97aed71a20258";
    };

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    niri,
    nixos-hardware,
    ...
  } @ inputs: let

    systems = [
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;

  in {

    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};

    nixosModules = import ./modules/nix;

    homeManagerModules = import ./modules/home;

    nixosConfigurations = {

      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          niri.nixosModules.niri
          (import ./hosts/desktop/disko.nix{device="/dev/disk/by-uuid/mNEOP4-MgMU-6wSu-9om0-XYh6-jrZD-iRuLX7";})
        ];
      };

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
