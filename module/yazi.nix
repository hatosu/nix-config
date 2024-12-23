{
  pkgs,
  strings,
  ...
}: {

  environment.shellAliases.y = "yazi";

  home-manager.users.hatosu = {

    programs.yazi = {
      enable = true;
      package = pkgs.yazi;
      enableZshIntegration = true;
      enableNushellIntegration = false;
      theme.manager = {
        border_style = {
          fg = "darkgray";
        };
      };
      theme.flavor = {
        use = "theme";
      };
    };

    home.file.".config/yazi/flavors/theme.yazi/flavor.toml".source = strings.flavortoml;

    home.file.".config/yazi/flavors/theme.yazi/tmtheme.xml".source = strings.tmthemexml;

  };

}
