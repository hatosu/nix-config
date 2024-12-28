{ pkgs, ... }: { environment.systemPackages =
    
      # default
      with pkgs; [
        help
        nixfind
        nixpaper
        nixocr
        wl-clipboard
        playerctl
        vlc
        tokei
        zip
        git
        wget
        lshw
        dos2unix
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
        reaper
        tree
        synfigstudio
        video-trimmer
        krita
        kdenlive
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
        freetube
      ]);

}
