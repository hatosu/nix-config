{lib,...}:{environment.sessionVariables={

# input-method
QT_IM_MODULE = "fcitx";
XMODIFIERS = "@im=fcitx";

# allow all nix-commands to use unfree packages
NIXPKGS_ALLOW_UNFREE = "1";

# tell /nix/store applications to display electron apps properly
NIXOS_OZONE_WL = "1";};

# set xdg folders
environment.etc = {
  "xdg/user-dirs.defaults".text = ''
    DOWNLOAD=X/Downloads
    DESKTOP=...
    TEMPLATES=...
    PUBLICSHARE=...
    DOCUMENTS=...
    MUSIC=...
    PICTURES=...
    VIDEOS=...
  '';
};}
