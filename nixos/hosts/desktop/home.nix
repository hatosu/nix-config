{ inputs, lib, config, pkgs, ... }: {

  imports = [
    inputs.self.homeManagerModules.terminal
    inputs.self.homeManagerModules.browser
    inputs.self.homeManagerModules.editor
    inputs.self.homeManagerModules.theme
    inputs.self.homeManagerModules.notification
    inputs.self.homeManagerModules.utility
    inputs.self.homeManagerModules.interface
    inputs.self.homeManagerModules.display
    inputs.self.homeManagerModules.other
    inputs.self.homeManagerModules.entry
    inputs.self.homeManagerModules.message
    inputs.self.homeManagerModules.media
    inputs.self.homeManagerModules.explorer
  ];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "hatosu";
    homeDirectory = "/home/hatosu";
  };

  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
