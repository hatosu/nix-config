{ pkgs ? import <nixpkgs> {} }: let

name = "kden";

desktopName = "Kdenlive";

zip = pkgs.fetchurl {
  url = "https://cdn3.filehaus.su/files/1732303306_72584/vosk.zip";
  sha256 = "";
};

drv = pkgs.runCommand "unpack" {} ''
  mkdir -p $out/files
  ${pkgs.unzip}/bin/unzip ${zip} -d "$out/files"
'';

script = pkgs.writeShellScriptBin name ''
  USER="$(whoami)"
  PATH=${pkgs.python3}/bin:${pkgs.python312Packages.pip}/bin:$PATH
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  if [ ! -d "$HOME/.local/share/kdenlive/profiles" ]; then
    mkdir -p "$HOME/.local/share/kdenlive/VOSK"
    cp -rf ${drv}/files/vosk/* "$HOME/.local/share/kdenlive/VOSK"
  fi
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

in pkgs.symlinkJoin {
  paths = [ script item ];
  inherit name;
}
