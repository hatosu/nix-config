{ pkgs, inputs, ... }: {

  # setup steam
  programs.gamemode.enable = true;
  environment.defaultPackages = [ pkgs.mangohud ];
  programs.steam = { enable = true;
  extraPackages = with pkgs; [ gamescope ];
  extraCompatPackages = with pkgs; [ proton-ge-bin ]; };

  # enable gacha game launchers
  programs.anime-game-launcher.enable = true;
  programs.sleepy-launcher.enable = true;

  # custom game packages
  environment.systemPackages = with inputs.nix-gaming.packages.${pkgs.system}; [
    osu-lazer-bin
    rocket-league
    star-citizen
  ];

  # other game packages
  users.users.hatosu.packages = with pkgs; [
    minecraft
  ];

  # support for xbox controller usb dongle
  hardware.xone.enable = true;

}
