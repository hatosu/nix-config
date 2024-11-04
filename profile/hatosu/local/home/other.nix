{ pkgs, ... }: {

  # nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # bat
  programs.bat = { 
    package = pkgs.bat; 
    enable = true;
    config = {
      theme = "base16";
    };
  };

}
