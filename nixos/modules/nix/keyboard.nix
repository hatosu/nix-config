{pkgs,lib,...}:{

  #enable keyd as hotkey service
  services.keyd.enable = true;
  services.keyd.keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          rightshift = "overload(rightshift, rightshift)";
          rightalt = "layer(meta)";
          leftmeta = "layer(alt)";
        };
        rightshift = {
          w = "up";
          a = "left";
          s = "down";
          d = "right";
        };
      };
  };

  #other language key input
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  i18n.inputMethod = {
    fcitx5.waylandFrontend = true;
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-mozc
      fcitx5-pinyin-zhwiki
      fcitx5-hangul
    ];
  };

}
