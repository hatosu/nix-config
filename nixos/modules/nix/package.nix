{pkgs,lib,...}:{environment={systemPackages=with pkgs;[

      # core
      ags
      wl-clipboard

      # cli tools
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
      playerctl
      mangohud
      element
      ffmpeg
  
      # programs
      zed-editor
      spotify
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
  
      # virtualization
      distrobox
  
      # screenshot software
      (pkgs.flameshot.override { enableWlrSupport = true; })
      grim
      slurp

      # icons
      adwaita-icon-theme
      papirus-icon-theme

    ];
  };
}
