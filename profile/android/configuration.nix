{
  lib,
  inputs,
  nixosVersion,
  nix-on-droid,
  ...
}: {

  imports = let module = inputs.self.nixosModules; in [
    ./local/android.nix
    ./local/manage.nix
    ./local/host.nix
    ./local/network.nix
    ./local/alias.nix
    ./local/package.nix
    ./local/utility.nix
    module.cli
    module.neovim
    module.tmux
    #module.yazi
    #module.mpv
  ];

  nixpkgs = { overlays = let overlay = inputs.self.overlays; in [
    nix-on-droid.overlays.default
    overlay.additions
    overlay.modifications
    overlay.fresh-packages
    overlay.latest-packages
    overlay.stable-packages
    overlay.pinned-packages
  ];};

  home-manager = {
    backupFileExtension = "hm-bak";
    users = {
      "hatosu" = import ./home.nix;
    };
  };

  environment.etcBackupExtension = ".bak";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = nixosVersion;

}
