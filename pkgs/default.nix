pkgs: {

  # utils
  nixvirt = pkgs.callPackage ./nixvirt { };
  nixfind = pkgs.callPackage ./nixfind { };
  nixpaper = pkgs.callPackage ./nixpaper { };
  nixocr = pkgs.callPackage ./nixocr { };
  help = pkgs.callPackage ./help { };

  # programs
  kden = pkgs.callPackage ./kden { };

  # games
  wiiudownloader = pkgs.callPackage ./wiiudownloader { };

}
