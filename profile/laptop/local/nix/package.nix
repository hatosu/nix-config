{ pkgs, lib, ... }:{ environment = { systemPackages = with pkgs; [

  # custom
  help
  nixocr
  nixfind
  wallpaper

  # cli tools
  htop
  wl-clipboard
  cliphist
  playerctl
  vlc
  git
  tokei
  rarcrack
  hyperfine
  watchexec
  wget
  shellcheck
  rclone
  lshw
  element

  # programs
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
  pinned.keypunch

  # icons
  adwaita-icon-theme
  papirus-icon-theme

]; }; }
