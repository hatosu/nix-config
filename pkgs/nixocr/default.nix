{ pkgs }:
let
  name = "nixocr";

  script = pkgs.writeText "${name}.sh" ''
    #!/bin/sh
    mkdir -p /tmp/nixocr
    ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" -t png /tmp/nixocr/input.png
    ${pkgs.latest.tesseract4}/bin/tesseract /tmp/nixocr/input.png /tmp/nixocr/output -l jpn
    cat /tmp/nixocr/output.txt | ${pkgs.wl-clipboard}/bin/wl-copy
    rm -rf /tmp/nixocr/*
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
