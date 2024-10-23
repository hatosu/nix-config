{ pkgs, inputs, personal-files, }: 

let

user-js = builtins.readFile "${personal-files}/other/firefox/user.js";

in

{ 

programs.firefox = { package = pkgs.firefox; enable = true; languagePacks = [ "jp" ];
policies = { DefaultDownloadDirectory = "\${home}/X/Downloads"; }; profiles.hatosu = { isDefault=true;

      # harden firefox & remove bloat
      extraConfig = "${user-js}";

      # choose extensions
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        yomitan
      ];

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

      # add bookmarks
      bookmarks = [ { name = "toolbar"; toolbar = true; bookmarks = [
        { url = "https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=%3B"; name = ""; }
        { url = "https://home-manager-options.extranix.com/?query=&release=master"; name = ""; }
        { url = "https://github.com/hatosu"; name = ""; }
        { url = "https://discord.com/channels/696438030189330482/1238755966439133235"; name = ""; }
        { url = "https://fmhy.net/videopiracyguide"; name = ""; }
        { url = "https://erynith.github.io/movie-web-instances/"; name = ""; }
      ];}];

};};}
