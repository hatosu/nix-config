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
  calc
  lshw
  element
  ffmpeg

  # programs
  kooha
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

  # virtualization
  distrobox

  # icons
  adwaita-icon-theme
  papirus-icon-theme

]; }; }
