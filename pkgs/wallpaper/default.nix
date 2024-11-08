{ pkgs ? import <nixpkgs> {} }:

let

  file = pkgs.fetchurl {
    url = "https://files.catbox.moe/yt2ihp.mp4";
    sha256 = "196i5lmpdpip80z7a7wl24yvh4iccf5gdph0fcydj7rpb6arqi6s";
  };

  width = "2560";

  height = "1080";

  # this crop runCommand below has to rebuild to have wallpaper work again, fix it
  crop = pkgs.runCommand "crop" {} ''
    mkdir -p $out/video
    ${pkgs.ffmpeg}/bin/ffmpeg -i ${file} -vf \
    "scale=${width}:${height}:force_original_aspect_ratio=increase,crop=${width}:${height}" \
    $out/video/wallpaper.mp4
  '';

  result = "${crop}/video/wallpaper.mp4";

  name = "wallpaper";

  script = pkgs.writeText "${name}.sh" ''
    #!/bin/sh
    ${pkgs.mpvpaper}/bin/mpvpaper -vs -o "no-audio loop" '*' ${result}
  '';

in

pkgs.stdenv.mkDerivation {
  name = "${name}";
  src = script;
  buildInputs = with pkgs; [ shc ];
  phases = [
    "buildPhase"
    "installPhase"
  ];
  buildPhase = ''
    shc -vrf ${script} -o ${name}
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp ${name} $out/bin
  '';
}
