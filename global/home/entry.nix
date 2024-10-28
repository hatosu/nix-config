{ config, pkgs, lib, inputs, ...}: let

# fetch custom icons ↓

discord-icon = "${inputs.personal-files}/icons/discord.png";

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
