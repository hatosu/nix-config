{ description = "Hatosu's NixOS flake.";

  inputs = {

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

    # disko
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

    # unstable (newest packages)
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # fresh (upcycle packages)
    nixpkgs-fresh.url = "github:nixos/nixpkgs/nixos-unstable";

    # stable (old packages)
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

    # impermanence
    impermanence.url = "github:nix-community/impermanence/e337457502571b23e449bf42153d7faa10c0a562";

    # nixos-hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/f5c239fa9acb27f0a5326ba2949c00fada89ca9f";

    # nix-gaming
    nix-gaming.url = "github:fufexan/nix-gaming/d5baae772ce87682c624233c7a9265b387caa818";

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

    systems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs systems; in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
    overlays = import ./overlay {inherit inputs;};
    nixosModules = import ./global/nix;
    homeManagerModules = import ./global/home;
    nixosConfigurations = {

      # desktop profile
      hatosu = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./profile/hatosu/configuration.nix
          home-manager.nixosModules.home-manager
          inputs.spicetify-nix.nixosModules.default
          aagl.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.disko.nixosModules.default
          (import ./profile/hatosu/local/nix/disk.nix{device="/dev/nvme0n1";})
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

      # temporary profile
      temporary = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./profile/temporary/configuration.nix
          inputs.disko.nixosModules.default
          (import ./profile/temporary/disk.nix{device="/dev/nvme0n1";})
        ];
      };

    };
  };
}
