{ pkgs ? import <nixpkgs> {} }: let

  # source
  zip = pkgs.fetchurl {
    url = "https://cdn5.filehaus.su/files/1730988675_99770/HoloCure.zip";
    sha256 = "11pbf6g9h28xg9dkipn0hk27qm65iijaljyvmxp7r8wi03fgi8gs";
  };
  drv = pkgs.runCommand "unpack" {} ''
    mkdir -p $out/files/holocure
    ${pkgs.unzip}/bin/unzip ${zip} -d "$out/files/holocure"
  '';
  src = "${drv}/files/holocure";

  # wine
  pname = "holocure";
  home-exe = "$HOME/.games/${pname}/HoloCure.exe";
  c-exe = "${pname}/HoloCure.exe";
  ver = pkgs.wine64;
  args = "arial cjkfonts vcrun2019 d3dcompiler_43 d3dcompiler_47 d3dx9";
  vars = ''
    export WINEESYNC=1
    export WINEARCH="win64"
    unset SDL_VIDEODRIVER
    unset EOS_USE_ANTICHEATCLIENTNULL
  '';

  # .desktop
  desktopName = "HoloCure!";
  comment = "Developed by Kay-Yu.";
  icon-url = "https://img.itch.zone/aW1nLzkyMzAxNzQucG5n/original/P4UFiN.png";
  icon-name = "P4UFiN.png";
  icon-sha = "1yln8yphs4jhg0rr1s65w7c500djjr7lgi8zankbnawcp7zxspdn";

  # meta
  description = "HoloCure, a game developed by Kay-Yu";
  homepage = "https://kay-yu.itch.io/holocure";
  maintainers = with pkgs.lib.maintainers; [ hatosu ];
  platforms = [ "x86_64-linux" ];
  license = pkgs.lib.licenses.unfree;

####################################

location = "$HOME/.games/${pname}/";
script = pkgs.writeShellScriptBin pname ''
  USER="$(whoami)"
  PATH=$PATH:${ver}/bin:${pkgs.winetricks}/bin
  export WINEPREFIX="${location}"
  ${vars}
  if [ ! -d "${location}" ]; then
    mkdir -m 777 -p ${location}
    cp -rf ${src}/* ${location}
    winetricks -q -f ${args}
    wineserver -k
    wine ${home-exe}
    wineserver -k
    mkdir -p ${location}/drive_c/${pname}
    chmod -R 777 "${location}"
    mv -f ${location}/drive_c "$HOME/.cache"
    mv -f ${location}/* "$HOME/.cache/drive_c/${pname}"
    mv -f "$HOME/.cache/drive_c" "${location}"
  fi
  ${pkgs.gamemode}/bin/gamemoderun wine "$WINEPREFIX/drive_c/${c-exe}"
  wineserver -w
'';
icon = builtins.fetchurl {
  url = icon-url;
  name = icon-name;
  sha256 = icon-sha;
};
item = pkgs.makeDesktopItem {
  inherit icon;
  inherit desktopName;
  inherit comment;
  name = pname;
  exec = "${script}/bin/${pname} %U";
  categories = ["Game"];
};
in
pkgs.symlinkJoin {
  name = pname;
  paths = [ script item ];
  meta = {
    inherit description;
    inherit homepage;
    inherit maintainers;
    inherit platforms;
    inherit license;
  };
}
