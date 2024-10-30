{ inputs, lib, config, pkgs, ... }: { imports = [

    # import local home modules
    ./local/home/display.nix
    ./local/home/interface.nix
    ./local/home/theme.nix
    ./local/home/other.nix

    # import global home modules
    inputs.self.homeManagerModules.terminal
    inputs.self.homeManagerModules.browser
    inputs.self.homeManagerModules.editor
    inputs.self.homeManagerModules.fetch
    inputs.self.homeManagerModules.entry
    inputs.self.homeManagerModules.message
    inputs.self.homeManagerModules.media
    inputs.self.homeManagerModules.explorer

]; nixpkgs = { overlays = [

    # import overlays
    inputs.self.overlays.additions
    inputs.self.overlays.modifications
    inputs.self.overlays.stable-packages

]; config = { allowUnfree = true; }; };
home.enableNixpkgsReleaseCheck = false;
programs.home-manager.enable = true;
home.username = "hatosu";
home.homeDirectory = "/home/hatosu";
home.stateVersion = "23.11";

dconf.settings = {
  "org/gnome/calculator" = {
    button-mode = "programming";
    show-thousands = true;
    base = 10;
    word-size = 64;
    window-position = lib.hm.gvariant.mkTuple [100 100];
  };
};

}
