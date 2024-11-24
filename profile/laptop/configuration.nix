{ inputs, lib, config, pkgs, strings, ... }: { 
imports = let module = inputs.self.nixosModules; in [

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
    module.pipewire
    module.spotify
    module.textfonts
    module.virtualmachines
    module.gaming
    module.hotkeys
    module.devstuff

]; nixpkgs = { overlays = let overlay = inputs.self.overlays; in [

    # import overlays
    overlay.additions
    overlay.modifications
    overlay.fresh-packages
    overlay.latest-packages
    overlay.stable-packages
    overlay.pinned-packages

]; }; home-manager = { backupFileExtension = "backup";
users = { "hatosu" = import ./home.nix; }; };
system.stateVersion = "24.05"; }
