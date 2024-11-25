{ config, pkgs, ... }: {

  # cursor
  home-manager.users.hatosu.home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.pinned.oreo-cursors-plus;
    name = "oreo_spark_light_pink_cursors";
    size = 20;
  };

  # gtk
  home-manager.users.hatosu.home.packages = [ pkgs.dconf ];
  home-manager.users.hatosu.home.sessionVariables.GSK_RENDERER = "gl";
  home-manager.users.hatosu.gtk = { 
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    theme = {
      package = pkgs.pinned.orchis-theme;
      name = "Orchis-Grey-Dark";
    };
  };

  # qt
  home-manager.users.hatosu.qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "Dracula";
      package = pkgs.pinned.dracula-qt5-theme;
    };
  };

}
