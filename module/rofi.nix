{ pkgs, inputs, strings, ...}: {

  home-manager.users.hatosu.programs.rofi = {
    package = pkgs.rofi;
    enable = true;
    terminal = "\${pkgs.foot}/bin/foot";
    theme = strings.stylerasi;
  };

}
