{ pkgs ? import <nixpkgs> {} }: let

name = "osu";

exe = pkgs.fetchurl {
  url = "https://m1.ppy.sh/r/osu!install.exe";
  sha256 = "sha256-3LlF27cCySOfmYy0HyqreL3toynU5IwlfWp1b9mr9Qk=";
};

exe-name = "osu!.exe";

args = "dotnet40";

vars = ''
  export WINEARCH=win32
  export PULSE_LATENCY_MSEC=40
  unset SDL_VIDEODRIVER
  unset EOS_USE_ANTICHEATCLIENTNULL
'';

location = "$HOME/.games/${name}";

script = pkgs.writeShellScriptBin name ''
  USER="$(whoami)"
  PATH=$PATH:${pkgs.wine64}/bin:${pkgs.winetricks}/bin
  export WINEPREFIX="${location}"
  ${vars}
  if [ ! -d "${location}" ]; then
    mkdir -p "${location}"
    wineboot --init
    wineserver -k
    winetricks --force ${args}
    wineserver -k
    cp -f ${exe} ${location}/${exe-name}
    wine64 '${location}/${exe-name}'
    wineserver -k
  fi
  wine64 '${location}/${exe}'
'';

icon = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/ppy/osu/master/assets/lazer.png";
  name = "lazer.png";
  sha256 = "0ldxf7lbr363lcfh0xqz6yjgdp1gzcjs7dmwl046n03nzprlvkrh";
};

item = pkgs.makeDesktopItem {
  desktopName = "Osu!";
  exec = "${script}/bin/${name} %U";
  inherit icon;
  inherit name;
};

in pkgs.symlinkJoin {
  paths = [ script item ];
  inherit name;
}
