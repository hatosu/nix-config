{ pkgs, ... }: 

  # language key input
  let theme = pkgs.fetchurl {
  url = "https://raw.githubusercontent.com/hatosu/personal-files/refs/heads/main/fcitx5/classicui.conf";
  sha256 = "0659f2i02sxyw30vrk5aqamqfqcak13ja0iv8s39aayi5ga937q2"; }; in {
  system.activationScripts.fcitx5-theme.text = ''
    mkdir -p /home/hatosu/.config/fcitx5/conf
    ln -sfn ${theme} /home/hatosu/.config/fcitx5/conf/classicui.conf '';
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        catppuccin-fcitx5
        fcitx5-gtk
        fcitx5-mozc
        fcitx5-pinyin-zhwiki
        fcitx5-hangul
      ];
      settings.inputMethod = {
        "Groups/0" = { Name = "Default"; "Default Layout" = "us"; DefaultIM = "mozc"; };
        "Groups/0/Items/0" = { Name = "keyboard-us"; Layout = ""; };
        "Groups/0/Items/1" = { Name = "mozc"; Layout = ""; };
        "Groups/0/Items/2" = { Name = "hangul"; Layout = ""; };
        "Groups/0/Items/3" = { Name = "keyboard-cn-altgr-pinyin"; Layout = ""; };
        "GroupOrder" = { "0" = "Default"; };
      };
    };
  };

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

}
