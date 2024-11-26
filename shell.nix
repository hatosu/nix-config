{
  shellpkgs ? import <nixpkgs> { },
}:

let
  pkgs = shellpkgs;
in

pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    nix
    git
    wine64
    winetricks
    dxvk
    gamemode
    appimage-run
  ];

  shellHook = ''
    echo "Welcome back, Hatosu :D" | ${pkgs.lolcat}/bin/lolcat 
  '';

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
  #PASSWORD = import ./password.nix;

}
