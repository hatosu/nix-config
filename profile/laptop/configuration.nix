{ inputs, lib, config, pkgs, strings, ... }: { imports = [

    # import the home-manager module
    inputs.home-manager.nixosModules.default

    # import local nix modules
    ./local/nix/disk.nix
    ./local/nix/impermanence.nix
    ./local/nix/hardware.nix
    ./local/nix/kernel.nix
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
    ./local/nix/other.nix

    # import global nix modules
    inputs.self.nixosModules.pipewire
    inputs.self.nixosModules.spotify
    inputs.self.nixosModules.textfonts
    inputs.self.nixosModules.virtualmachines
    inputs.self.nixosModules.gaming
    inputs.self.nixosModules.hotkeys

]; nixpkgs = { overlays = [

    # import overlays
    inputs.self.overlays.additions
    inputs.self.overlays.modifications
    inputs.self.overlays.stable-packages
    inputs.self.overlays.pinned-packages
    inputs.self.overlays.edge-packages
    
]; }; home-manager = { backupFileExtension = "backup";
extraSpecialArgs = { inherit inputs; inherit strings; };
users = { "hatosu" = import ./home.nix; }; };
system.stateVersion = "23.11"; }
