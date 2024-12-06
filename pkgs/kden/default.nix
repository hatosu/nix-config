#{ pkgs ? import <nixpkgs> {}, }: let

#  name = "kden";

#  desktopName = "Kdenlive";

#  zip = pkgs.fetchurl {
#    url = "https://cdn4.filehaus.su/files/1732430853_76238/speechmodels.zip";
#    sha256 = "061xh9wc0iyrdf65jwhwar1rfn0lcv101bam4i69g4nq2sc56kf7";
#  };

#  drv = pkgs.runCommand "unpack" { } ''
#    mkdir -p $out/files
#    ${pkgs.unzip}/bin/unzip ${zip} -d "$out/files"
#  '';

#  #PATH=$PATH:${pkgs.python312.withPackages(ps: with ps; [ pip toolz setuptools srt ])}/bin:${vosk}/bin
#  script = pkgs.writeShellScriptBin name ''
#    USER="$(whoami)"
#    PATH=$PATH:${pkgs.python312.withPackages (ps: with ps; [ pip toolz setuptools srt ])}/bin
#    if [ ! -d "$HOME/.local/share/kdenlive/speechmodels" ]; then
#      mkdir -p "$HOME/.local/share/kdenlive/speechmodels"
#      cp -rf ${drv}/files/speechmodels/* "$HOME/.local/share/kdenlive/speechmodels"
#    fi
#    ${pkgs.kdenlive}/bin/kdenlive
#  '';

#  icon = builtins.fetchurl {
#    url = "https://files.catbox.moe/ys8vqz.png";
#    sha256 = "1kd09mdq8qrfqi8b2raakmxrqvdjfxnb6fp6gg8p23h23glhnx3g";
#  };

#  item = pkgs.makeDesktopItem {
#    exec = "${script}/bin/${name} %F";
#    inherit icon name desktopName;
#  };

#in pkgs.symlinkJoin {
#  paths = [
#    script
#    item
#  ];
#  inherit name;
#}

{
  pkgs ? import <nixpkgs> { },
}:
let

  name = "kden";

  desktopName = "Kdenlive";

  script = pkgs.writeShellScriptBin name ''
    ${pkgs.kdenlive}/bin/kdenlive
  '';

  icon = builtins.fetchurl {
    url = "https://files.catbox.moe/ys8vqz.png";
    sha256 = "1kd09mdq8qrfqi8b2raakmxrqvdjfxnb6fp6gg8p23h23glhnx3g";
  };

  item = pkgs.makeDesktopItem {
    exec = "${script}/bin/${name} %F";
    inherit icon name desktopName;
  };

in
pkgs.symlinkJoin {
  paths = [
    script
    item
  ];
  inherit name;
}
