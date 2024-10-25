{ lib, ... }: { environment.sessionVariables = {

  # input-method
  XMODIFIERS = "@im=fcitx";
  QT_IM_MODULE = "fcitx";
  GTK_IM_MDOULE = "fcitx";
  GLFW_IM_MODULE = "ibus";

  # allow all nix-commands to use unfree packages
  NIXPKGS_ALLOW_UNFREE = "1";

  # graphical
  WLR_NO_HARDWARE_CURSORS = "1";

  # tell /nix/store applications to display electron apps properly
  NIXOS_OZONE_WL = "1";

  };
}
