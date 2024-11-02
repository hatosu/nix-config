{ pkgs, lib, ... }:{ environment = { systemPackages = with pkgs; [

  # cli tools
  help
  nixocr
  nixfind
  wl-clipboard
  playerctl
  nixfmt-rfc-style
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
  ffmpeg

  # programs
  kdenlive
  krita
  blender
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
