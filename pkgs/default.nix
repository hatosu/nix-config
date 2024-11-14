pkgs: {

  # utils
  nixvirt          = pkgs.callPackage ./nixvirt          {};
  nixfind          = pkgs.callPackage ./nixfind          {};
  nixpaper         = pkgs.callPackage ./nixpaper         {};
  ocr              = pkgs.callPackage ./ocr              {};
  help             = pkgs.callPackage ./help             {};

  # games
  plutonium        = pkgs.callPackage ./plutonium        {};
  osu              = pkgs.callPackage ./osu              {};
  ddlc             = pkgs.callPackage ./ddlc             {};
  holocure         = pkgs.callPackage ./holocure         {};

}
