{ pkgs, config, inputs, ... }: {

  # bat
  programs.bat = { 
    package = pkgs.bat; 
    enable = true;
    config = {
      theme = "base16";
    };
  };

  # move xdg folders to .cache
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      download = "${config.home.homeDirectory}/.cache/Downloads";
      desktop = "${config.home.homeDirectory}/.cache/Desktop";
      videos = "${config.home.homeDirectory}/.cache/Videos";
      pictures = "${config.home.homeDirectory}/.cache/Pictures";
      documents = "${config.home.homeDirectory}/.cache/Documents";
      templates = "${config.home.homeDirectory}/.cache/Templates";
      publicShare = "${config.home.homeDirectory}/.cache/Public";
      music = "${config.home.homeDirectory}/.cache/Music";
    };
  };

}
