{ pkgs, lib, ... }:{ environment = { systemPackages = with pkgs; [
 
  # custom
  nixfind
  nixpaper
  help
  ocr
  davinci

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
  stable.krita
  stable.libreoffice-fresh
  stable.lmms
  stable.freecad
  stable.godot_4
  stable.blender
  stable.zoom-us
  stable.anki-bin
  stable.obsidian
  stable.tor-browser
  pinned.komikku
  pinned.ciano

  # icons
  pinned.adwaita-icon-theme
  pinned.papirus-icon-theme

]; }; }
