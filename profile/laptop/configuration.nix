{
  inputs,
  nixosVersion,
  ...
}: {

  imports = let
    module = inputs.self.nixosModules;
  in [

    # import the home-manager module
    inputs.home-manager.nixosModules.default

    # import local nix modules
    ./local/disk.nix
    ./local/impermanence.nix
    ./local/hardware.nix
    ./local/boot.nix
    ./local/host.nix
    ./local/network.nix
    ./local/package.nix
    ./local/manage.nix
    ./local/alias.nix
    ./local/function.nix
    ./local/secure.nix
    ./local/utility.nix

    # import global nix modules
    module.pipewire
    module.textfonts
    module.virtualmachines
    module.gaming
    module.hotkeys
    module.devstuff
    module.rofi
    module.cli
    module.tmux
    module.fastfetch
    module.firefox
    module.mpv
    module.neovim
    module.vesktop
    module.yazi
    module.ags
    module.obs
    module.flameshot
    module.radio-cli
    module.hyprland
    #module.niri
    #module.gnome
    #module.awesome
    #module.kde

  ];

  nixpkgs = {
    overlays = let
      overlay = inputs.self.overlays;
    in [

      # import overlays
      overlay.additions
      overlay.modifications
      overlay.fresh-packages
      overlay.latest-packages
      overlay.stable-packages
      overlay.pinned-packages
    
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    users = {
      "hatosu" = import ./home.nix;
    };
  };
  system.stateVersion = nixosVersion;
}
