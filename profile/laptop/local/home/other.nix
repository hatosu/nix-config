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

  # language
  home.language = {
    base = "ja_JP.UTF-8";
    ctype = "ja_JP.UTF-8";
    numeric = "ja_JP.UTF-8";
    time = "ja_JP.UTF-8";
    collate = "ja_JP.UTF-8";
    monetary = "ja_JP.UTF-8";
    messages = "ja_JP.UTF-8";
    paper = "ja_JP.UTF-8";
    name = "ja_JP.UTF-8";
    address = "ja_JP.UTF-8";
    telephone = "ja_JP.UTF-8";
    measurement = "ja_JP.UTF-8";
  };

}
