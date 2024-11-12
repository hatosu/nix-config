{ shellpkgs ? import <nixpkgs> {} }:

let pkgs = shellpkgs; in

pkgs.mkShell {
  
  nativeBuildInputs = with pkgs; [
    nix
    git
    ffmpeg
    wine64
    winetricks
    dxvk
    gamemode
  ];

  shellHook = ''
    echo "Welcome back, Hatosu :D" | ${pkgs.lolcat}/bin/lolcat 
  '';

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
  #PASSWORD = import ./password.nix;

}
