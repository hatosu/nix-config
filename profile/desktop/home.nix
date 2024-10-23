{ inputs, lib, config, pkgs, ... }: {

  imports = [

    # import modules
    inputs.self.homeManagerModules.terminal
    inputs.self.homeManagerModules.browser
    inputs.self.homeManagerModules.editor
    inputs.self.homeManagerModules.theme
    inputs.self.homeManagerModules.interface
    inputs.self.homeManagerModules.other
    inputs.self.homeManagerModules.entry
    inputs.self.homeManagerModules.message
    inputs.self.homeManagerModules.media
    inputs.self.homeManagerModules.explorer
    inputs.self.homeManagerModules.display
  
  ];

  nixpkgs = {
    overlays = [

      # import overlays
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.stable-packages
    
    ];
    config = {
      allowUnfree = true;
    };
  };

  # nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # homemanager stuff
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
  home = {
    username = "hatosu";
    homeDirectory = "/home/hatosu";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
