{ pkgs ? import <nixpkgs> {} }: let

name = "davinci";

exec = pkgs.writeShellScriptBin name
"LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 __GLX_VENDOR_LIBRARY_NAME=nvidia LIBVA_DRIVER_NAME=nvidia QT_QPA_PLATFORM=xcb QT_PLUGIN_PATH=/etc/profiles/per-user/hatosu/lib/qt-6/plugins ${pkgs.stable.davinci-resolve}/bin/davinci-resolve";

icon = builtins.fetchurl {
  url = "https://files.catbox.moe/n22pjs.png";
  name = "davinci.png";
  sha256 = "1xjdhkrj2pgjaj3xdacmijghndc06xm3vjixi8ap4w1p1303av9a";
};

item = pkgs.makeDesktopItem {
  desktopName = "Davinci Resolve";
  exec = "${exec}/bin/${name} %U";
  inherit icon;
  inherit name;
};

in pkgs.symlinkJoin {
  paths = [ exec item ];
  inherit name;
}
