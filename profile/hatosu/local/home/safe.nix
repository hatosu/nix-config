{ pkgs, inputs, ...}: {

  imports = [ inputs.impermanence.nixosModules.home-manager.impermanence ];

  home.persistence."/persist/home" = {
    directories = [
      "X"
      { directory = ".local/share/Steam"; method = "symlink"; }
    ];
    files = [
      ".zsh_history"
    ];
    allowOther = true;
  };  

}
