{ pkgs, lib, ... }:{ environment = { systemPackages = with pkgs; [

  # cli tools
  help
  nixocr
  nixfind
  wallpaper
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

  # testing
  ffmpeg

  # programs
  kdenlive
  krita
  #blender
  zoom-us
  anki-bin
  libreoffice-fresh
  lmms
  obsidian
  virt-viewer
  obs-studio
  freecad
  komikku
  ciano
  flameshot

  # icons
  adwaita-icon-theme
  papirus-icon-theme

]; }; }
