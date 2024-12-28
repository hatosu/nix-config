{pkgs, ...}: {
  home-manager.users.hatosu.xsession.windowManager.awesome = {
    package = pkgs.stable.awesome;
    enable = true;
    #luaModules = [ pkgs.luaPackages.vicious ];
    noArgb = true; # disables transparency for performance
  };

  # config
  home.file.".config/awesome" = let
    config = "
    # erm
  ";
  in {
    source = config;
    force = true;
  };
}
