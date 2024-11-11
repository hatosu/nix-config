{ pkgs, inputs, strings, ... }: { programs.yazi = { package = pkgs.yazi; enable=true;
enableZshIntegration = true; enableNushellIntegration = false;

    theme.manager = {
      border_style = {
        fg = "darkgray";
      };
    };

theme.flavor = { use = "theme"; };};
home.file."toml" = { source = strings.flavortoml; 
target = ".config/yazi/flavors/theme.yazi/flavor.toml"; force = true; };
home.file."xml" = { source = strings.tmthemexml;
target = ".config/yazi/flavors/theme.yazi/tmtheme.xml"; force = true; }; }
