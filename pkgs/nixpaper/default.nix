{
  pkgs ? import <nixpkgs> { },
}:

let

  name = "nixpaper";

  file = pkgs.fetchurl {
    url = "https://files.catbox.moe/yt2ihp.mp4";
    sha256 = "196i5lmpdpip80z7a7wl24yvh4iccf5gdph0fcydj7rpb6arqi6s";
  };

  width = "2560";

  height = "1080";

  crop = pkgs.runCommand "crop" { } ''
    mkdir -p $out/video
    ${pkgs.ffmpeg}/bin/ffmpeg -i ${file} -vf \
    "scale=${width}:${height}:force_original_aspect_ratio=increase,crop=${width}:${height}" \
    $out/video/wallpaper.mp4
  '';

in

pkgs.writeShellScriptBin "${name}" ''
  #!/usr/bin/env bash
  ${pkgs.mpvpaper}/bin/mpvpaper -p -o "no-audio loop" '*' ${crop}/video/wallpaper.mp4
''
