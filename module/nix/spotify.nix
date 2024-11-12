{ pkgs, inputs, ... }: { programs.spicetify = let
spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system}; 

  # name of theme ↓ 
  theme-name = "defaultDynamic"; in { 

  # choose extensions
  enabledExtensions = with spicePkgs.extensions; [
    adblock
    hidePodcasts
    popupLyrics
    history
    betterGenres
    goToSong
    songStats
    listPlaylistsWithSong
    beautifulLyrics
    copyLyrics
    copyToClipboard
    fullScreen
  ];

theme = spicePkgs.themes.${theme-name}; 
colorScheme = "${theme-name}"; enable = true; };
systemd.tmpfiles.rules = [ "d /home/hatosu/.config/spotify 0777 hatosu users 99999d" ]; }
