{pkgs,...}:let help=pkgs.writeShellScriptBin"help"''

#!/usr/bin/env bash
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

'';in{environment.systemPackages=[help];}
