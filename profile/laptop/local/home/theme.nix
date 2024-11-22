{ config, pkgs, ... }: {

  # cursor
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.pinned.oreo-cursors-plus;
    name = "oreo_spark_light_pink_cursors";
    size = 20;
  };

  # gtk
  home.packages = [ pkgs.dconf ];
  home.sessionVariables.GSK_RENDERER = "gl";
  gtk = { 
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    theme = {
      package = pkgs.pinned.orchis-theme;
      name = "Orchis-Grey-Dark";
    };
  };

  # qt
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "Dracula";
      package = pkgs.pinned.dracula-qt5-theme;
    };
  };

}
