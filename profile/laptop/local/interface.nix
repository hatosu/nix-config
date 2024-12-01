{ pkgs, inputs, strings, ... }: {

  # app menu
  home-manager.users.hatosu.programs.rofi = {
    package = pkgs.rofi;
    enable = true;
    terminal = "\${pkgs.foot}/bin/foot";
    theme = strings.stylerasi;
  };

  # bar
  home-manager.users.hatosu.programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        output = [ "*" ];
        layer = "top";
        position = "bottom";
        margin = "5px";
        height = 32;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/language"
          "user"
        ];
        modules-center = [
          "hyprland/window"
          "privacy"
        ];
        modules-right = [
          "tray"
          "cpu"
          "temperature"
          "memory"
          "disk"
          "clock"
        ];
      };
    };
    style = strings.waybarstylecss;
  };

}
