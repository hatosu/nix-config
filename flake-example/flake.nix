{

  description = "hello-world flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  
  let
    
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  
  in
  
  {
    
    packages.${system}.default = pkgs.stdenv.mkDerivation {

      name = "hello-world";
     
      src = ./src;
    
      phases = [
        "unpackPhase"
        "buildPhase"
        "installPhase"
      ];
    
      buildPhase = ''
        g++ hello-world.cpp -o hello-world
      '';
    
      installPhase = ''
        mkdir -p $out/bin
        cp hello-world $out/bin
      '';

    };
  
  };

}
