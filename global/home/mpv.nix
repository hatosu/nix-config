{ config, pkgs, ... }: {

  #setup mpv to be BOTH your VIDEO and IMAGE viewer!!! mwahahaha >:3
  programs.mpv = {
    enable = true;
    package = pkgs.mpv;
    config = {
      profile = "gpu-hq";
      ytdl-format = "bestvideo+bestaudio";
      background = "0.2";
      osc = "no";
      sub-auto = "no";
      term-status-msg = "no";
      image-display-duration = "inf";
      loop-file = "inf";
      loop-playlist = "inf";
      window-dragging = "no";
    };
    bindings = {
      LEFT = "playlist-prev";
      RIGHT = "playlist-next";
    };

  };

}
