{
  lib,
  inputs,
  nixosVersion,
  ...
}: {

  imports = let module = inputs.self.nixosModules; in [
    
    ./local/wsl.nix
    ./local/manage.nix
    ./local/host.nix
    ./local/network.nix
    ./local/alias.nix
    ./local/package.nix
    ./local/utility.nix

    module.cli
    module.neovim
    module.tmux
    module.yazi
    module.mpv
  
  ];

  nixpkgs = { overlays = let overlay = inputs.self.overlays; in [

      overlay.additions
      overlay.modifications
      overlay.fresh-packages
      overlay.latest-packages
      overlay.stable-packages
      overlay.pinned-packages
    
  ];};

  home-manager = {
    backupFileExtension = "backup";
    users = {
      "hatosu" = import ./home.nix;
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = nixosVersion;

}
