pkgs: {

  # utils
  nixfind          = pkgs.callPackage ./nixfind          {};
  help             = pkgs.callPackage ./help             {};
  nixocr           = pkgs.callPackage ./nixocr           {};
  wallpaper        = pkgs.callPackage ./wallpaper        {};

  # games
  ddlc             = pkgs.callPackage ./ddlc             {};
  holocure         = pkgs.callPackage ./holocure         {};

}
