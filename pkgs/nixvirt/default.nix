{pkgs ? import <nixpkgs> {}}: let
  #https://github.com/HikariKnight/quickpassthrough
  #https://github.com/quickemu-project/quickemu/issues/688
  name = "nixvirt";

  script = pkgs.writeShellScriptBin name ''
    if [ ! -d "$HOME/.windows/windows-11" ]; then
      mkdir -p "$HOME/.windows"
      cd "$HOME/.windows"
      ${pkgs.quickemu}/bin/quickget windows 11
    fi
    cd
    ${pkgs.quickemu}/bin/quickemu --vm "$HOME/.windows/windows-11.conf"
  '';

  icon = builtins.fetchurl {
    url = "https://static-00.iconduck.com/assets.00/distributor-logo-nixos-icon-2048x2048-x0x4v0dx.png";
    name = "distributor-logo-nixos-icon-2048x2048-x0x4v0dx.png";
    sha256 = "01amh4xnvhgaqn9yp2bdwlvynh29jiq9bwx0hrz2k22fy39nxsdh";
  };

  item = pkgs.makeDesktopItem {
    desktopName = "nixvirt";
    exec = "${script}/bin/${name} %U";
    inherit icon;
    inherit name;
  };
in
  pkgs.symlinkJoin {
    paths = [
      script
      item
    ];
    inherit name;
  }
