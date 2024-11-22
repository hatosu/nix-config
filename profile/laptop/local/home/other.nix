{ pkgs, config, inputs, ... }: {

  # bat
  programs.bat = { 
    package = pkgs.bat; 
    enable = true;
    config = {
      theme = "base16";
    };
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
