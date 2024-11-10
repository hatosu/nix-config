{ pkgs, inputs, strings, ... }: let custom-user-js = builtins.readFile strings.userjs;
in { programs.firefox = { package = pkgs.firefox; enable = true; 
policies.DefaultDownloadDirectory = "/home/hatosu/X/Downloads";
languagePacks = [ "jp" ]; profiles.hatosu = { isDefault = true;

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
        { url = "https://noogle.dev/"; name = ""; }
        { url = "https://home-manager-options.extranix.com/?query=&release=master"; name = ""; }
        { url = "https://github.com/hatosu"; name = ""; }
        { url = "https://www.phind.com/search?home=true"; name = ""; }
        { url = "https://www.apkmirror.com/?post_type=app_release&searchtype=apk&s=apkmirror+installer&minapi-max=30&arch%5B%5D=universal&arch%5B%5D=x86&arch%5B%5D=x86_64&bundles%5B%5D=apk_files"; name = ""; }
        { url = "https://itch.io/games/free/platform-windows"; name = ""; }
        { url = "https://discord.com/channels/696438030189330482/1238755966439133235"; name = ""; }
        { url = "https://dpp.dev/"; name = ""; }
        { url = "https://fmhy.net/videopiracyguide"; name = ""; }
        { url = "https://erynith.github.io/movie-web-instances/"; name = ""; }
        { url = "https://jpdb.io/learn"; name = ""; }
        { url = "https://app.cachix.org/cache/hatosu#push"; name = ""; }
        { url = "https://filehaus.su/"; name = ""; }
        { url = "https://picsur.org/upload"; name = ""; }
        { url = "https://catbox.moe/"; name = ""; }
        { url = "https://litterbox.catbox.moe/"; name = ""; }
        { url = "https://theindex.moe/"; name = ""; }
        { url = "https://thewiki.moe/"; name = ""; }
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
