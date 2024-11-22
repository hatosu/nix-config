{ pkgs ? import <nixpkgs> {} }: let

name = "cemuu";

desktopName = "Cemu";

zip = pkgs.fetchurl {
  url = "https://cdn5.filehaus.su/files/1732148946_28905/cemu.zip";
  sha256 = "sha256-Z68VgTldjbJxA3s8Ddi8OgeNmEkneiuEGiBWZ7/fos4=";
};

drv = pkgs.runCommand "unpack" {} ''
  mkdir -p $out/files
  ${pkgs.unzip}/bin/unzip ${zip} -d "$out/files"
'';

exec = pkgs.writeShellScriptBin name ''
  USER="$(whoami)"
  if [ ! -d "$HOME/.local/share/Cemu/games" ]; then
    mkdir -p "$HOME/.local/share/Cemu/games"
    mkdir -p "$HOME/.config/Cemu"
    cp -rf ${drv}/files/Cemu/local/* "$HOME/.local/share/Cemu"
    cp -rf ${drv}/files/Cemu/config/* "$HOME/.config/Cemu"
  fi
  ${pkgs.stable.cemu}/bin/cemu
'';

icon = builtins.fetchurl {
  url = "https://files.catbox.moe/zt78lm.png";
  sha256 = "0ac9jkq5cbdh6ijd2vf6g2sgmn6fv6r10jvbasm1a4wv5dn7f8dz";
};

item = pkgs.makeDesktopItem {
  exec = "${exec}/bin/${name} %U";
  inherit icon name desktopName;
};

in pkgs.symlinkJoin {
  paths = [ exec item ];
  inherit name;
}
