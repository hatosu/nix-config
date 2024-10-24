{ pkgs, inputs, ... }: {

  # enables steam & allows you to use gamescope launch option
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # enable gacha game launchers
  programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
  programs.anime-games-launcher.enable = true;
  programs.sleepy-launcher.enable = true;

  # download custom packages of games fine tuned for nixos
  environment.systemPackages = with inputs.nix-gaming.packages.${pkgs.system}; [
    viper
    osu-lazer-bin
    #star-citizen
    #rocket-league
  ];

  # allows you to use gamemode launch option in steam
  programs.gamemode.enable = true;

  # support for xbox controller usb dongle
  hardware.xone.enable = true;

}
