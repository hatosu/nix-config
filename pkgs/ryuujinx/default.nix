{ pkgs ? import <nixpkgs> {} }: let

# find firmware.zip files below
# https://prodkeys.net/ryujinx-firmware-v2/

name = "ryuujinx";

desktopName = "Ryuujinx";

prod = pkgs.fetchurl {
  url = "https://files.catbox.moe/n9zipu.keys";
  sha256 = "04n1aai6yjikvhh26vx9fcw0h2647y6dl9xgqc46431sx739b603";
  name = "prod.keys";
};

title = pkgs.fetchurl {
  url = "https://files.catbox.moe/1x2uc0.keys";
  sha256 = "0xq6ijyi646mz4jgzk9ss546mhqbx56x7hn674kr4yfzh9z6zmiy";
  name = "title.keys";
};

games = {

  totk = pkgs.fetchurl {
    url = "";
    sha256 = "";
  };

  totk-update = pkgs.fetchurl {
    url = "https://cdn3.filehaus.su/files/1731911796_52651/The_Legend_of_Zelda_Tears_of_the_Kingdom__0100F2C0115B6800__v393216_.nsp";
    sha256 = "0msayb29x0knn3d3x485952h9y9b5lig46vn2nnyh21dckdb4v3c";
  };

};

exec = pkgs.writeShellScriptBin name ''
  USER="$(whoami)"
  if [ ! -d "$HOME/.config/Ryujinx/system" ]; then
    mkdir -p "$HOME/.config/Ryujinx/system"
    mkdir -p "$HOME/.config/Ryujinx/games"
    cp -f ${prod} "$HOME/.config/Ryujinx/system/prod.keys"
    cp -f ${title} "$HOME/.config/Ryujinx/system/title.keys"
    cp -f ${games.totk} ${games.totk-update} "$HOME/.config/Ryujinx/games"
  fi
  ${pkgs.latest.ryujinx}/bin/ryujinx
'';

icon = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/GreemDev/Ryujinx/master/distribution/misc/Logo.svg";
  name = "logo.svg";
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
