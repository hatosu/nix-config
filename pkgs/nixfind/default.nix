{ pkgs }: let

  # enter name
  name = "nixfind";

  # enter script contents
  script = pkgs.writeText "${name}.sh" ''
    #!/bin/sh
    echo -e "select category\n1. Nix Packages\n2. Nix Options\n3. Home Options\n"
    read -p "enter choice (1-3):" choice
    case $choice in
      1)
        if [ "$#" -ne 1 ]; then
          echo "Usage: $0 <search_term>"
          exit 1
        fi
        nix search nixpkgs "$1" && clear && nix search nixpkgs "$1" | grep -A 1 "*" | less && clear
        ;;
      2)
        if [ "$#" -ne 1 ]; then
          echo "Usage: $0 <search_term>"
          exit 1
        fi
				man configuration.nix 2> /dev/null | awk "/$1/,/\<nixpkgs\/nixos\//" | less
        ;;
      3)
        if [ "$#" -ne 1 ]; then
          echo "Usage: $0 <search_term>"
          exit 1
        fi
        man home-configuration.nix 2> /dev/null | awk "/$1/,/\<home-manager\/modules\//" | less
        ;;
      *)
        echo "Invalid selection."
        exit 1
        ;;
    esac
  '';

in pkgs.stdenv.mkDerivation {
name = "${name}";
src = script;
buildInputs = with pkgs; [ shc ];
phases = [ "buildPhase" "installPhase" ];
buildPhase = '' shc -vrf ${script} -o ${name} '';
installPhase = ''
  mkdir -p $out/bin
  cp ${name} $out/bin
'';}
