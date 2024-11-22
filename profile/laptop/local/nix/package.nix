{ pkgs, lib, ... }:{ environment = { systemPackages = with pkgs; [
 
  # custom
  nixfind
  nixpaper
  help
  nixocr
  #kden

  # cli
  htop
  wl-clipboard
  playerctl
  vlc
  git
  tokei
  zip
  rarcrack
  hyperfine
  watchexec
  wget
  shellcheck
  rclone
  lshw
  grim
  slurp
  pinned.element
  pinned.cliphist

  # gui
  krita
  stable.libreoffice-fresh
  stable.lmms
  stable.freecad
  stable.godot_4
  stable.blender
  stable.zoom-us
  stable.anki-bin
  stable.obsidian
  stable.tor-browser
  stable.gnome.nautilus
  pinned.komikku
  pinned.ciano

  # icons
  pinned.adwaita-icon-theme
  pinned.papirus-icon-theme

]; }; }
