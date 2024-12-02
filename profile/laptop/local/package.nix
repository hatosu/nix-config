{ pkgs, ...}: { environment.systemPackages =

  # default
  with pkgs; [
    nixfind
    nixpaper
    nixocr
    help
    kden
    #voice-changer
  ]

  # fresh
  ++ (with pkgs.fresh; [
    woeusb
    cargo
    nixfmt-rfc-style
    ffmpeg
    appimage-run
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
    ciano
  ])

  # latest
  ++ (with pkgs.latest; [
    backgroundremover
  ])

  # stable
  ++ (with pkgs.stable; [
    synfigstudio
    video-trimmer
    krita
    libreoffice
    lmms
    freecad
    godot_4
    blender
    zoom-us
    anki-bin
    obsidian
    tor-browser
    komikku
    ripgrep
  ])

  # pinned
  ++ (with pkgs.pinned; [
    element
    cliphist
  ]);

}
