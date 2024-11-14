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
    plutonium
    osu
    ddlc
    holocure
    latest.minecraft
    latest.cemu
  ];

  # support for xbox controller usb dongle
  hardware.xone.enable = true;

}
