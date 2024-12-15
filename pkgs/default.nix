pkgs: {

  # utils
  nixfind = pkgs.callPackage ./nixfind {};
  nixpaper = pkgs.callPackage ./nixpaper {};
  nixocr = pkgs.callPackage ./nixocr {};
  help = pkgs.callPackage ./help {};
  install = pkgs.callPackage ./install {};

  # games
  wiiudownloader = pkgs.callPackage ./wiiudownloader {};
}
