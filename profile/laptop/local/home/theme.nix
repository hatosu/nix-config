{ config, pkgs, ... }: {

  # apply cursor config
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.pinned.oreo-cursors-plus;
    name = "oreo_grey_cursors";
    size = 20;
  };

  # apply gtk config
  home.packages = [ pkgs.dconf ];
  home.sessionVariables.GSK_RENDERER = "gl";
  gtk = { enable = true;
    theme = {
      package = pkgs.pinned.orchis-theme;
      name = "Orchis-Grey-Dark";
    };
  };

  # apply qt config
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "Dracula";
      package = pkgs.pinned.dracula-qt5-theme;
    };
  };

}
