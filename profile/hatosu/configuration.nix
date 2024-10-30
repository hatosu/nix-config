{ inputs, lib, config, pkgs, ... }: { imports = [

    # import the home-manager module
    inputs.home-manager.nixosModules.default

    # import local nix modules
    ./local/nix/disk.nix
    ./local/nix/impermanence.nix
    ./local/nix/hardware.nix
    ./local/nix/driver.nix
    ./local/nix/boot.nix
    ./local/nix/login.nix
    ./local/nix/host.nix
    ./local/nix/network.nix
    ./local/nix/package.nix
    ./local/nix/root.nix
    ./local/nix/manage.nix
    ./local/nix/alias.nix
    ./local/nix/function.nix
    ./local/nix/session.nix
    ./local/nix/init.nix
    ./local/nix/secure.nix
    ./local/nix/variable.nix
    ./local/nix/other.nix

    # import global nix modules
    inputs.self.nixosModules.kernel
    inputs.self.nixosModules.audio
    inputs.self.nixosModules.font
    inputs.self.nixosModules.game
    inputs.self.nixosModules.virtualization
    inputs.self.nixosModules.keyboard
    inputs.self.nixosModules.music

]; nixpkgs = { config = { allowUnfree = true; allowBroken = true; }; overlays = [

    # import overlays
    inputs.self.overlays.additions
    inputs.self.overlays.modifications
    inputs.self.overlays.stable-packages
    
];}; home-manager = { backupFileExtension = "backup";
extraSpecialArgs = { inherit inputs; };
users = { "hatosu" = import ./home.nix; }; };
system.stateVersion = "23.11";}
