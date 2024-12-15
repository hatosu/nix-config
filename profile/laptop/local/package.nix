{ 
  pkgs,
  ... 
}: {

  environment.systemPackages =
    
      # default
      with pkgs; [
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
        obsidian
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
        kdenlive
      ])
      
      # stable
      ++ (with pkgs.stable; [
        anki-bin
        reaper
        tree
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
        isoimagewriter
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
