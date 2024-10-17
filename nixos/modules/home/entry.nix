{ config, pkgs, lib, ...}: let

# fetch custom icons ↓

discord-icon = pkgs.fetchurl {
  url = "https://cdn-icons-png.flaticon.com/256/3800/3800030.png";
  sha256 = "1eae33fe63d9e1497d3e0b21ac6267cdd1a55f7b8789b29f8b2ad00dd8dc958c";
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

    ciano = {
      exec = "com.github.robertsanseries.ciano";
      icon = "com.github.robertsanseries.ciano";
      name = "Convert";
      genericName = "File Converter";
      comment = "Convert files to... other files!";
      terminal = false;
      settings = {Keywords = "converter;multimedia;audio;video;photo;photography";};
      categories = [ "GTK" "Video" "Audio" "Photography" "AudioVideo" "AudioVideoEditing" "Graphics" ];
      type = "Application";
    };

  };
}
