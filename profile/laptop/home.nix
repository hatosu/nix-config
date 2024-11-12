{ inputs, lib, config, pkgs, strings, ... }: { imports = [

    # import local home modules
    ./local/home/display.nix
    ./local/home/interface.nix
    ./local/home/theme.nix
    ./local/home/other.nix

    # import global home modules
    inputs.self.homeManagerModules.cli
    inputs.self.homeManagerModules.fastfetch
    inputs.self.homeManagerModules.firefox
    inputs.self.homeManagerModules.mpv
    inputs.self.homeManagerModules.neovim
    inputs.self.homeManagerModules.vesktop
    inputs.self.homeManagerModules.yazi

]; nixpkgs = { overlays = [

    # import overlays
    inputs.self.overlays.additions
    inputs.self.overlays.modifications
    inputs.self.overlays.stable-packages
    inputs.self.overlays.pinned-packages
    inputs.self.overlays.edge-packages

]; config = { allowUnfree = true; }; };
home.enableNixpkgsReleaseCheck = false;
programs.home-manager.enable = true;
home.username = "hatosu";
home.homeDirectory = "/home/hatosu";
home.stateVersion = "23.11";}
