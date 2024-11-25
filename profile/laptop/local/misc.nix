{ pkgs, config, inputs, ... }: 
let home = config.home-manager.users.hatosu.home.homeDirectory; in {

  # bat
  home-manager.users.hatosu.programs.bat = { 
    package = pkgs.bat; 
    enable = true;
    config = {
      theme = "base16";
    };
  };

  # move xdg folders to .cache
  home-manager.users.hatosu.xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      download = "${home}/.cache/Downloads";
      desktop = "${home}/.cache/Desktop";
      videos = "${home}/.cache/Videos";
      pictures = "${home}/.cache/Pictures";
      documents = "${home}/.cache/Documents";
      templates = "${home}/.cache/Templates";
      publicShare = "${home}/.cache/Public";
      music = "${home}/.cache/Music";
    };
  };

  # nicely reload system units when changing configs
  home-manager.users.hatosu.systemd.user.startServices = "sd-switch";

}
