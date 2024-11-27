{ config, pkgs, ... }: { home-manager.users.hatosu = {

  gtk = {
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    enable = true;
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme.override {
        tweaks = [ "black" "rimless" "float" "normal" ];
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "Dracula";
      package = pkgs.pinned.dracula-qt5-theme;
    };
  };
  
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.pinned.oreo-cursors-plus;
    name = "oreo_spark_light_pink_cursors";
    size = 20;
  };

  # fixes hm error
  home.sessionVariables.GSK_RENDERER = "gl";
  
};}
