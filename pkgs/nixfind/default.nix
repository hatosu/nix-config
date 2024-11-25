{ pkgs }: pkgs.writeShellScriptBin "nixfind" ''
  
  #!/usr/bin/env bash
  echo -e "select category\n1. Nix Packages\n2. Nix Options\n3. Home Options\n"
  read -p "enter choice (1-3):" choice
  case $choice in
    1)
      if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <search_term>"
        exit 1
      fi
      ${pkgs.nh}/bin/nh search -c nixos-unstable "$1" | tac | less
      ;;
    2)
      if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <search_term>"
        exit 1
      fi
      man configuration.nix 2> /dev/null | awk "/$1/,/Declared/" > /tmp/nixfind_result
      grep -v '/' /tmp/nixfind_result > /tmp/nixfind_result2
      highlight() {
        while IFS= read -r line; do
          period_count=$(echo "$line" | tr -cd '.' | wc -c)
          if [ $period_count -ge 2 ]; then
            echo -e "\033[38;5;218m$line\033[0m"
          else
            echo "$line"
          fi
        done < "$1"
      }
      highlight /tmp/nixfind_result2 | less
      ;;
    3)
      if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <search_term>"
        exit 1
      fi
      man home-configuration.nix 2> /dev/null | awk "/$1/,/Declared/" > /tmp/nixfind_result
      grep -v '/' /tmp/nixfind_result > /tmp/nixfind_result2
      highlight() {
        while IFS= read -r line; do
          period_count=$(echo "$line" | tr -cd '.' | wc -c)
          if [ $period_count -ge 2 ]; then
            echo -e "\033[38;5;218m$line\033[0m"
          else
            echo "$line"
          fi
        done < "$1"
      }
      highlight /tmp/nixfind_result2 | less
      ;;
    *)
      echo "Invalid selection."
      exit 1
      ;;
  esac

''
