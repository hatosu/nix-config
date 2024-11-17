{ pkgs, inputs, ... }: {

  # setup steam
  programs.gamemode.enable = true;
  environment.defaultPackages = with pkgs; [ pinned.mangohud ];
  programs.steam = {
    package = pkgs.steam;
    enable = true;
    extraPackages = with pkgs; [ latest.gamescope ];
    extraCompatPackages = with pkgs; [ latest.proton-ge-bin ];
  };

  # game packages
  environment.systemPackages = with pkgs; [
    latest.shadps4
    latest.minecraft
    latest.cemu
    wiiudownloader
  ];

  # support for xbox controller usb dongle
  hardware.xone.enable = true;

}
