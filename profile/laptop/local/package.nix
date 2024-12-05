{ pkgs, ...}: { environment.systemPackages =

  # default
  with pkgs; [
    kden
    help
    nixfind
    nixpaper
    nixocr
    ciano
    wl-clipboard
    playerctl
    vlc
    git
    tokei
    zip
    wget
    slurp
    grim
    lshw
  ]

  # fresh
  ++ (with pkgs.fresh; [
    nixfmt-rfc-style
  ])

  # latest
  ++ (with pkgs.latest; [
    ffmpeg
    tor-browser
  ])

  # stable
  ++ (with pkgs.stable; [
    anki-bin
    synfigstudio
    video-trimmer
    krita
    libreoffice
    lmms
    freecad
    godot_4
    blender
    zoom-us
    komikku
    ripgrep
    mission-center
    rarcrack
    hyperfine
    watchexec
    shellcheck
    rclone
  ])

  # pinned
  ++ (with pkgs.pinned; [
    element
    cliphist
  ]);

}
