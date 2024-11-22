{ pkgs, config, inputs, ... }: {

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

  # move xdg folders to X
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      download = "${config.home.homeDirectory}/files/Default/Downloads";
      desktop = "${config.home.homeDirectory}/files/Default/Desktop";
      videos = "${config.home.homeDirectory}/files/Default/Videos";
      pictures = "${config.home.homeDirectory}/files/Default/Pictures";
      documents = "${config.home.homeDirectory}/files/Default/Documents";
      templates = "${config.home.homeDirectory}/files/Default/Templates";
      publicShare = "${config.home.homeDirectory}/files/Default/Public";
      music = "${config.home.homeDirectory}/files/Default/Music";
    };
  };

}
