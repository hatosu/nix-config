{ pkgs }:

let

  repo = pkgs.fetchFromGitHub {
    owner = "hatosu";
    repo = "personal-files";
    rev = "15ca6de735bbd0b23d5a493de6358260309c14b2";
    hash = "sha256-l9Q39zH1bBE0MLVKaIuD5qw3XCywQ/Nprh2Tk0hSqGA=";
  };

  width = "2560";

  height = "1080";

  crop = pkgs.runCommand "crop" {} ''
    mkdir -p $out/videos
    ${pkgs.ffmpeg}/bin/ffmpeg -i ${repo}/wallpapers/wallpaper.mp4 -vf \
    "scale=${width}:${height}:force_original_aspect_ratio=increase,crop=${width}:${height}" \
    $out/videos/wallpaper.mp4
  '';

  name = "wallpaper";

  script = pkgs.writeText "${name}.sh" ''
    #!/bin/sh
    ${pkgs.mpvpaper}/bin/mpvpaper -vs -o "no-audio loop" '*' ${crop}/videos/wallpaper.mp4
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
