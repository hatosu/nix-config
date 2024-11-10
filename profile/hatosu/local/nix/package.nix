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

  # testing
  ffmpeg

  # programs
  davinci-resolve
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
