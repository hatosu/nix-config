{ pkgs, lib, ... }:{ environment = { systemPackages = with pkgs; [

  # custom
  nixfind
  nixpaper
  help
  ocr

  # cli
  htop
  wl-clipboard
  cliphist
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
  element

  # gui
  davinci-resolve
  krita
  godot_4
  #blender
  zoom-us
  anki-bin
  libreoffice-fresh
  lmms
  obsidian
  obs-studio
  freecad
  komikku
  ciano
  flameshot

  # icons
  adwaita-icon-theme
  papirus-icon-theme

]; }; }
