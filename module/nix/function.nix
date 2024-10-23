{ pkgs, ... }: { environment.interactiveShellInit = ''

rebuild(){
  sudo nixos-rebuild switch --flake /etc/nixos#desktop
  ${pkgs.noti}/bin/noti -t 'REBUILD' -m 'system successfully rebuilt according to your personal nix configuration files >:3'
  LOCK_FILE="/home/hatosu/X/.run_once_lock"
  if [ -f "$LOCK_FILE" ]; then
    echo 'done >x3'
  else
    # ↓ run once commands go here
    sudo waydroid init
    # ↑
    sudo touch "$LOCK_FILE"
    ${pkgs.noti}/bin/noti -t 'RUNONCE' -m 'finished executing run-once commands' 
  fi
}

heal(){
  sudo echo
  sudo nix-collect-garbage 2> /dev/null | awk '/freed/,/freed/'
  sudo nix-store --gc 2> /dev/null | awk ' '
  sudo nix-store --optimise
  sudo nix store optimise
  ${pkgs.noti}/bin/noti -t "HEAL COMMAND" -m "Successfully cleared temp nix files & optimized store! >x3"
}

update(){
  sudo nix flake update --flake /etc/nixos
  ${pkgs.noti}/bin/noti -t 'UPDATE COMMAND' -m 'system update completed successfully'
}

nix-sync(){
  sudo git rm -r ~/X/Github/personal-config/*
  sudo cp -rf /etc/nixos/* ~/X/Github/personal-config
  cd ~/X/Github/personal-config
  sudo git switch main
  sudo git add .
  sudo git add -A
  sudo git commit -am "-"
  sudo git push personal-config
}

shafind(){
  if [[ ! -z "$1" ]]; then
    curl "$1" | sha256sum
  else
    sha256sum "$1"
  fi
}

iconfind(){
  if [[ ! -z "$1" ]]; then
    xdg-open "https://www.google.com/search?q=$1+icon+filetype:png&udm=2"
  else
    echo 'Invalid Link!'
  fi
}

run(){
  number=$1
  shift
  for i in `seq $number`; do
    $@
  done
}

newest(){
  find . -type f \( ! -regex '.*/\..*' \) -print0 | xargs -0 stat -c "%Y:%n" | sort -n| tail -n 10 | cut -d ':' -f2-
}

ex(){
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)${pkgs.toybox}/bin/tar xvjf $1 ;;
      *.tar.gz)${pkgs.toybox}/bin/tar xvzf $1 ;;
      *.bz2)${pkgs.toybox}/bin/bunzip2 $1 ;;
      *.rar)${pkgs.unrar}/bin/unrar x $1 ;;
      *.gz)${pkgs.toybox}/bin/gunzip $1 ;;
      *.tar)${pkgs.toybox}/bin/tar xvf $1 ;;
      *.tbz2)${pkgs.toybox}/bin/tar xvjf $1 ;;
      *.tgz)${pkgs.toybox}/bin/tar xvzf $1 ;;
      *.zip)${pkgs.unzip}/bin/unzip $1 ;;
      *.Z)${pkgs.ncompress}/bin/compress $1 ;;
      *.7z)${pkgs.p7zip}/bin/7z x $1 ;;
      *)echo "can't extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

'';}
