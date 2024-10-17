{config,pkgs,...}:{

  # apply cursor config
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package =pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 25;
  };

  # apply gtk config
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
  };

  # apply qt config
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

}
