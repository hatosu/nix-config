{ config, pkgs, lib, ...}: let

# fetch custom icons ↓

discord-icon = pkgs.fetchurl {
  url = "https://raw.githubusercontent.com/hatosu/personal-files/refs/heads/main/icons/discord.png";
  sha256 = "134mvkc0vl1aifgv52c7gdgsblfdcxiaq88b7rylkqfrcgz37bhy";
};

in { xdg.desktopEntries = {

# modify desktop entries ↓

    vesktop = {
      exec = "vesktop --enable-features=UseOzonePlatform --ozone-platform=x11 --enable-wayland-ime %U";
      icon = "${discord-icon}";
      name = "Discord";
      genericName = "Internet Messenger";
      comment = "some random discord client...";
      noDisplay = false;
      prefersNonDefaultGPU = false;
      startupNotify = true;
      terminal = false;
      settings = {
        Keywords = "discord;vencord;electron;chat";
        DBusActivatable = "false";
      };
      actions = {
        "Wayland" = {
          exec = "${pkgs.vesktop}/bin/vesktop %u";
          name = "Wayland";
          icon = "vesktop";
        };
      };
      categories = [ "Network" "InstantMessaging" "Chat" ];
      mimeType = [ "" "" "" ];
      type = "Application";
    };

  };
}
