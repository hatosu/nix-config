pkgs: {

  # utils
  nixvirt          = pkgs.callPackage ./nixvirt          {};
  nixfind          = pkgs.callPackage ./nixfind          {};
  nixpaper         = pkgs.callPackage ./nixpaper         {};
  nixocr           = pkgs.callPackage ./nixocr           {};
  help             = pkgs.callPackage ./help             {};

  # games
  wiiudownloader   = pkgs.callPackage ./wiiudownloader   {};

}
