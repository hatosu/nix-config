{ pkgs }: let

  # enter name
  name = "help";

  # enter script contents
  script = pkgs.writeText "${name}.sh" ''
    #!/bin/sh
    echo -e "select desired option\n1. Man\n2. Tldr\n3. Navi\n"
    read -p "enter your choice (1-3):" choice
    case $choice in
    1)
      if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <search_term>"
        exit 1
      fi
      ${pkgs.man}/bin/man "$1"
      ;;
    2)
      if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <search_term>"
        exit 1
      fi
      ${pkgs.tldr}/bin/tldr "$1" | less
      ;;
    3)
      if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <search_term>"
        exit 1
      fi
      ${pkgs.navi}/bin/navi --finder 'fzf' --cheatsh "$1"
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
