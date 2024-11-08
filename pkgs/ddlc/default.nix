{ pkgs ? import <nixpkgs> {} }: let

  # source
  zip = pkgs.fetchurl {
    url = "https://cdn7.filehaus.su/files/1730985666_82698/ddlc-win.zip";
    sha256 = "0bk38pjpa24bdagb7f30yjyjjzijybjyr9p0mhr9lwh6kabdfg9a";
  };
  drv = pkgs.runCommand "unpack" {} ''
    mkdir -p $out/files
    ${pkgs.unzip}/bin/unzip ${zip} -d "$out/files"
  '';
  src = "${drv}/files/DDLC-1.1.1-pc";

  # wine
  pname = "DDLC";
  home-exe = "$HOME/.games/${pname}/DDLC.exe";
  c-exe = "${pname}/DDLC.exe";
  args = "arial cjkfonts vcrun2019 d3dcompiler_43 d3dcompiler_47 d3dx9";
  vars = ''
    unset SDL_VIDEODRIVER
    unset EOS_USE_ANTICHEATCLIENTNULL
    export WINEESYNC=1
  '';

  # .desktop
  desktopName = "Doki Doki Literature Club!";
  comment = "Developed by Team Salvato.";
  icon-url = "https://raw.githubusercontent.com/SecondThundeR/DokiDoki-RenPy/your-reality/readme_files/logos/ddlc_logo.png";
  icon-name = "ddlc_logo.png";
  icon-sha = "166lfzz278sr5cdgiq6dgivcg5ma1zdaj8i8ds6l5d8szbrl09mg";

  # meta
  description = "Doki Doki Literature Club (DDLC) a game developed by Team Salvato";
  homepage = "https://ddlc.moe/";
  maintainers = with pkgs.lib.maintainers; [ hatosu ];
  platforms = [ "x86_64-linux" ];
  license = pkgs.lib.licenses.unfree;

####################################

location = "$HOME/.games/${pname}/";
script = pkgs.writeShellScriptBin pname ''
  USER="$(whoami)"
  PATH=$PATH:${pkgs.wine}/bin:${pkgs.winetricks}/bin
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
