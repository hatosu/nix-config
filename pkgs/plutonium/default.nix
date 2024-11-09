{ pkgs ? import <nixpkgs> {} }: let

  # name
  pname = "plutonium";

  # source
  executable = pkgs.fetchurl {
  url = "https://cdn.plutonium.pw/updater/plutonium.exe";
  sha256 = "03rzf0clm5vgiq479zh54xg6bjgfn1ph1hi8i6wxk0aq9p5d3lc5"; };
  file = pkgs.runCommand "file" {} ''
    mkdir -p $out/exe
    cp -f ${executable} $out/exe/${pname}.exe
  '';

  # wine
  home-exe = "$HOME/.games/${pname}/plutonium.exe";
  c-exe = "${pname}/plutonium.exe";
  pkg = pkgs.wine64;
  version = "wine64";
  args = "dotnet48 d3dcompiler_47 corefonts vcrun2005 d3dcompiler_43 d3dx11_42 d3dx11_43 gfw msasn1 physx xact_x64 xact xinput";
  vars = ''
    unset SDL_VIDEODRIVER
    unset EOS_USE_ANTICHEATCLIENTNULL
    export WINEARCH="win64"
    export WINEESYNC=1
    export STAGING_RT_PRIORITY_SERVER=1
    export vblank_mode=0
  '';

  # .desktop
  desktopName = "Plutonium Launcher";
  comment = "Developed by the Plutonium Team.";
  icon-url = "https://pbs.twimg.com/profile_images/993278064883851265/QrvMbLC7_400x400.jpg";
  icon-name = "QrvMbLC7_400x400.jpg";
  icon-sha = "1cwgbpsj2salq89jfrr5qplan6cds602qnakpvmjf5fyzqnl9n31";

  # meta
  description = "Plutonium Launcher, software developed by the Plutonium Team";
  homepage = "https://plutonium.pw";
  maintainers = with pkgs.lib.maintainers; [ hatosu ];
  platforms = [ "x86_64-linux" ];
  license = pkgs.lib.licenses.unfree;

####################################

location = "$HOME/.games/${pname}";
script = pkgs.writeShellScriptBin pname ''
  USER="$(whoami)"
  PATH=$PATH:${pkg}/bin:${pkgs.winetricks}/bin
  export WINEPREFIX="${location}"
  ${vars}
  if [ ! -d "${location}" ]; then
    mkdir -m 777 -p ${location}
    cp -f ${file}/exe/* ${location}
    mkdir -m 777 -p ${location}/drive_c/${pname}
    chmod -R 777 "${location}"
    winecfg -v win10
    wineserver -k
    winetricks -q -f ${args}
    wineserver -k
    mkdir -m 777 -p ${location}/drive_c/${pname}
    chmod -R 777 "${location}"
    mv -f ${location}/drive_c "$HOME/.cache"
    mv -f ${location}/* "$HOME/.cache/drive_c/${pname}"
    mv -f "$HOME/.cache/drive_c" "${location}"
  fi
  ${pkgs.gamemode}/bin/gamemoderun ${version} "$WINEPREFIX/drive_c/${c-exe}"
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

