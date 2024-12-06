{ pkgs, ... }:
{
  environment.systemPackages =

    # default
    with pkgs;
    [
      kden
      help
      nixfind
      nixpaper
      nixocr
      ciano
      wl-clipboard
      playerctl
      vlc
      tokei
      zip
      git
      wget
      lshw
    ]

    # fresh
    ++ (with pkgs.fresh; [
      slurp
      grim
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
