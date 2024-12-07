{ pkgs
, strings
, ...
}: {
  # enable keyd as hotkey service
  services.keyd = {
    enable = true;
    keyboards.default = {
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
  };

  # language key input
  environment.sessionVariables = {
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
    GTK_IM_MDOULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
  home-manager.users.hatosu.home.file."classicui.conf" = {
    source = strings.classicuiconf;
    target = ".config/fcitx5/conf/classicui.conf";
    force = true;
  };
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs.pinned; [
        catppuccin-fcitx5
        fcitx5-gtk
        fcitx5-mozc
        fcitx5-pinyin-zhwiki
        fcitx5-hangul
      ];
      settings.inputMethod = {
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "mozc";
        };
        "Groups/0/Items/0" = {
          Name = "keyboard-us";
          Layout = "";
        };
        "Groups/0/Items/1" = {
          Name = "mozc";
          Layout = "";
        };
        "Groups/0/Items/2" = {
          Name = "hangul";
          Layout = "";
        };
        "Groups/0/Items/3" = {
          Name = "keyboard-cn-altgr-pinyin";
          Layout = "";
        };
        "Groups/0/Items/4" = {
          Name = "keyboard-fr";
          Layout = "";
        };
        "GroupOrder" = {
          "0" = "Default";
        };
      };
    };
  };
}
