{ pkgs ? import <nixpkgs> {} }: let

name = "Ryuujinx";

desktopName = "Ryujinx";

zip = pkgs.fetchurl {
  url = "https://cdn7.filehaus.su/files/1732157452_93084/ryujinx.zip";
  sha256 = "";
};

drv = pkgs.runCommand "unpack" {} ''
  mkdir -p $out/files
  ${pkgs.unzip}/bin/unzip ${zip} -d "$out/files"
'';

exec = pkgs.writeShellScriptBin name ''
  USER="$(whoami)"
  if [ ! -d "$HOME/.config/Ryujinx/system" ]; then
    mkdir -p "$HOME/.config/Ryujinx"
    cp -rf ${drv}/files/Ryujinx/config/* "$HOME/.config/Ryujinx"
  fi
  ${pkgs.ryujinx}/bin/ryujinx
'';

icon = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/GreemDev/Ryujinx/master/distribution/misc/Logo.svg";
  sha256 = "0y19gn31rdl3vd3a2md67b5jw400mch92hlmq3shpgay3cb5ylar";
};

item = pkgs.makeDesktopItem {
  exec = "${exec}/bin/${name} %U";
  inherit icon name desktopName;
};

in pkgs.symlinkJoin {
  paths = [ exec item ];
  inherit name;
}
