pkgs: {

  # utils
  nixvirt = pkgs.callPackage ./nixvirt { };
  nixfind = pkgs.callPackage ./nixfind { };
  nixpaper = pkgs.callPackage ./nixpaper { };
  nixocr = pkgs.callPackage ./nixocr { };
  help = pkgs.callPackage ./help { };

  # programs
  kden = pkgs.callPackage ./kden { };
  voice-changer = pkgs.callPackage ./voice-changer { };

  # games
  wiiudownloader = pkgs.callPackage ./wiiudownloader { };

}
