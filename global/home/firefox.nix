{ pkgs, inputs, strings, ... }: let custom-user-js = builtins.readFile strings.userjs;
in { programs.firefox = { package = pkgs.firefox; enable = true; languagePacks = [ "jp" ];
policies = { DefaultDownloadDirectory = "/home/hatosu/X/Downloads"; }; profiles.hatosu = { isDefault = true;

      # harden firefox & remove bloat
      extraConfig = "${custom-user-js}";

      # choose extensions
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        yomitan
      ];

      # add bookmarks
      bookmarks = [ { name = "toolbar"; toolbar = true; bookmarks = [
        { url = "https://nixos.wiki/"; name = "wiki"; }
        { url = "https://search.nixos.org/packages?channel=unstable"; name = "packages"; }
        { url = "https://search.nixos.org/options?channel=unstable"; name = "options"; }
        { url = "https://search.nixos.org/flakes?"; name = "flakes"; }
        { url = "https://noogle.dev/"; name = "functions"; }
        { url = "https://home-manager-options.extranix.com/?query=&release=master"; name = "home"; }
        { url = "https://www.apkmirror.com/?post_type=app_release&searchtype=apk&s=apkmirror+installer&minapi-max=30&arch%5B%5D=universal&arch%5B%5D=x86&arch%5B%5D=x86_64&bundles%5B%5D=apk_files"; name = "installer"; }
        { url = "https://www.apkmirror.com/?post_type=app_release&searchtype=apk&s=roblox&minapi-max=30&arch%5B%5D=universal&arch%5B%5D=x86&arch%5B%5D=x86_64&bundles%5B%5D=apkm_bundles"; name = "bundles"; }
        { url = "https://github.com/hatosu"; name = "hatosu"; }
        { url = "https://discord.com/channels/696438030189330482/1238755966439133235"; name = "kotoba"; }
        { url = "https://fmhy.net/videopiracyguide"; name = "media"; }
      ];}];

      # customize chrome CSS
      userChrome = ''
        #navigator-toolbox::after { border-bottom: 0px !important; }
        #nav-bar { box-shadow: none !important; border-top: none !important; }
        #navigator-toolbox { background-color: #1c1c1b !important; }
        #urlbar-background { background: #313438 !important; }
        :root { --toolbar-bgcolor: #1c1c1b !important; }
        :root { --toolbar-color: #EBF5FE !important; }
      '';

      # customize content CSS
      userContent = ''
        @-moz-document url-prefix("about:home"), url-prefix("about:newtab") {
          :root {
            --newtab-background-color: #1c1c1b !important;
          }
        }
      '';

};};}
