{ description = "Hatosu's NixOS flake.";

  inputs = {

    # unstable (newest packages)
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # stable (older packages)
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/e83414058edd339148dc142a8437edb9450574c8";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # disko
    disko = {
      url = "github:nix-community/disko/67dc29be3036cc888f0b9d4f0a788ee0f6768700";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # firefox addons
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
    impermanence.url = "github:nix-community/impermanence/c7f5b394397398c023000cf843986ee2571a1fd7";

    # nixos hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/f5c239fa9acb27f0a5326ba2949c00fada89ca9f";

    # nix gaming
    nix-gaming.url = "github:fufexan/nix-gaming/d5baae772ce87682c624233c7a9265b387caa818";

  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, aagl, ... } @ inputs: let

    strings = import ./misc/strings/default.nix;
    systems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs systems;

  in {
      
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});  
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
    overlays = import ./overlay {inherit inputs;};
    nixosModules = import ./global/nix;
    homeManagerModules = import ./global/home;
    
    nixosConfigurations = {

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs; inherit strings;};
        modules = [
          ./profile/hatosu/configuration.nix
          home-manager.nixosModules.home-manager
          inputs.home-manager.nixosModules.default
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.spicetify-nix.nixosModules.default
          aagl.nixosModules.default
        ];
      };

      temporary = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs; inherit strings;};
        modules = [
          ./profile/temporary/configuration.nix
          inputs.disko.nixosModules.default
        ];
      };

      server1 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs; inherit strings;};
        modules = [
          ./profile/server1/configuration.nix
          inputs.disko.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
        ];
      };

    };
  };
}
