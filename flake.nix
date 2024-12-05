{
  description = "Hatosu's NixOS flake.";

  inputs = {

    # default (new packages)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # fresh (newer packages)
    nixpkgs-fresh.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # latest (newest packages)
    nixpkgs-latest.url = "github:nixos/nixpkgs?ref=master";

    # stable (old packages)
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # pinned (wont update)
    nixpkgs-pinned.url = "github:nixos/nixpkgs/f83f99270023d739b4ab3fa51f39778165bb4920";

    # impermanence
    impermanence.url = "github:nix-community/impermanence/c7f5b394397398c023000cf843986ee2571a1fd7";

    # nixos hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/59b6e11bea99805b02ab38c8f9d8ba21fee58874";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/819f682269f4e002884702b87e445c82840c68f2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # plasma manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager/88ca377ff58b5c30a2879745829842554d4b21d5";
      inputs.nixpkgs.follows = "nixpkgs"; inputs.home-manager.follows = "home-manager";
    };

    # disko
    disko = {
      url = "github:nix-community/disko/67dc29be3036cc888f0b9d4f0a788ee0f6768700";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # firefox addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons&ref=51d5446f359b67d5b6fdf45a145391c4d8679b3e";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix/396cf13f9310aa82c1a5da24a5213e7170d40642";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      plasma-manager,
      nixos-hardware,
      ... 
    } @ inputs: let

      # read before changing: https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
      nixosVersion = "24.05";

      systems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      shellpkgs = nixpkgs.legacyPackages.x86_64-linux;

      vars = import ./vars/default.nix;

      strings = import ./strings/default.nix;

      specialArgs = { inherit inputs vars strings nixosVersion; };

      # hm & pm stuff
      homeManager = [ home-manager.nixosModules.home-manager
      { home-manager = { extraSpecialArgs = specialArgs; sharedModules =
      [ inputs.plasma-manager.homeManagerModules.plasma-manager ]; }; } ];

    in {

      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      overlays = import ./overlay { inherit inputs; };

      nixosModules = import ./module;

      devShells.x86_64-linux.default = (import ./shell.nix { inherit shellpkgs; });

      nixosConfigurations = {

        laptop = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = homeManager ++ [
            ./profile/laptop/configuration.nix
            inputs.disko.nixosModules.default
            inputs.impermanence.nixosModules.impermanence
            inputs.spicetify-nix.nixosModules.default
          ];
        };

        server1 = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./profile/server1/configuration.nix
            inputs.disko.nixosModules.default
            inputs.impermanence.nixosModules.impermanence
          ];
        };

        proj1 = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./profile/proj1/configuration.nix
            inputs.disko.nixosModules.default
            inputs.impermanence.nixosModules.impermanence
          ];
        };

        temporary = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./profile/temporary/configuration.nix
            inputs.disko.nixosModules.default
          ];
        };

      };
    };
}
