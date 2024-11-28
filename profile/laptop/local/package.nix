{ pkgs, lib, ... }: { environment = { systemPackages = with pkgs; [

      # custom
      nixfind
      nixpaper
      help
      nixocr
      kden
      #voice-changer

      # cli
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
      latest.backgroundremover
      pinned.element
      pinned.cliphist

      # gui
      ciano
      stable.synfigstudio
      stable.video-trimmer
      stable.krita
      stable.libreoffice
      stable.lmms
      stable.freecad
      stable.godot_4
      stable.blender
      stable.zoom-us
      stable.anki-bin
      stable.obsidian
      stable.tor-browser
      pinned.komikku

];};}
