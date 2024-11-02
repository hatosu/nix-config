{ pkgs }:

let

  repo = pkgs.fetchFromGitHub {
    owner = "hatosu";
    repo = "personal-config";
    rev = "5938f596e8a222e3a8e169c756cf0f4050fa915f";
    hash = "sha256-zi4VPljlSqcsozlNUoSLx9xdReQl6IGoPUTPpPWwmCQ=";
  };

  width = "2560";

  height = "1080";

  crop = pkgs.runCommand "crop" {} ''
    mkdir -p $out/videos
    ${pkgs.ffmpeg}/bin/ffmpeg -i ${repo}/misc/media/wallpaper.mp4 -vf \
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
