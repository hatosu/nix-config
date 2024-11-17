pkgs: {

  # utils
  nixvirt          = pkgs.callPackage ./nixvirt          {};
  nixfind          = pkgs.callPackage ./nixfind          {};
  nixpaper         = pkgs.callPackage ./nixpaper         {};
  ocr              = pkgs.callPackage ./ocr              {};
  help             = pkgs.callPackage ./help             {};

  # programs
  davinci          = pkgs.callPackage ./davinci          {};

  # games
  ryuujinx         = pkgs.callPackage ./ryuujinx         {};
  wiiudownloader   = pkgs.callPackage ./wiiudownloader   {};

}
