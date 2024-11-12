{ pkgs, inputs, ... }: {

  # setup steam
  programs.gamemode.enable = true;
  environment.defaultPackages = with pkgs; [ pinned.mangohud ];
  programs.steam = {
    package = pkgs.steam;
    enable = true;
    extraPackages = with pkgs; [ pinned.gamescope ];
    extraCompatPackages = with pkgs; [ edge.proton-ge-bin ];
  };

  # game packages
  environment.systemPackages = with pkgs; [
    plutonium
    osu
    ddlc
    holocure
    edge.minecraft
    edge.cemu
  ];

  # support for xbox controller usb dongle
  hardware.xone.enable = true;

}
