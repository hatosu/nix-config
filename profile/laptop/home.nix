{ inputs, lib, config, pkgs, strings, nixosVersion, ... }: { 

  programs.home-manager.enable = true;

  home.enableNixpkgsReleaseCheck = false;
    
  home.username = "hatosu";
    
  home.homeDirectory = "/home/hatosu";
    
  home.stateVersion = nixosVersion;

}
