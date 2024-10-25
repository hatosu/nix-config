{ pkgs, lib, ... }:{ environment = { systemPackages = with pkgs; [

  # custom packages
  wallpaper
  nixocr
  nixfind
  help

  # cli tools
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
  mangohud
  element
  ffmpeg

  # programs
  #zed-editor
  kooha
  kdenlive
  krita
  blender
  zoom-us
  anki-bin
  libreoffice-fresh
  lmms
  obsidian
  bottles
  lutris
  minecraft
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
