{ config, pkgs, ... }: {

  # apply cursor config
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 20;
  };

  # apply gtk config
  gtk = {
    enable = true;
    theme = {
      package = pkgs.pinned.orchis-theme;
      name = "Orchis-Dark";
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
