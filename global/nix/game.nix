{ pkgs, inputs, ... }: {

  # enables steam & allows usage of gamescope launch option
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # enable gacha game launchers
  programs.anime-game-launcher.enable = true;
  programs.sleepy-launcher.enable = true;

  # custom game packages
  environment.systemPackages = with inputs.nix-gaming.packages.${pkgs.system}; [
    osu-lazer-bin
    rocket-league
    star-citizen
  ];

  # gaming related nixpkgs
  environment.defaultPackages = with pkgs; [
    minecraft
    mangohud
  ];

  # allows usage of gamemode launch option in steam
  programs.gamemode.enable = true;

  # support for xbox controller usb dongle
  hardware.xone.enable = true;

}
