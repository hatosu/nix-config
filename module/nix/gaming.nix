{ pkgs, inputs, ... }: {

  # setup steam
  programs.gamemode.enable = true;
  environment.defaultPackages = [ pkgs.mangohud ];
  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [ gamescope ];
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    dedicatedServer.openFirewall = false;
    package = pkgs.steam.override {
      extraLibraries = pkgs: with pkgs; [
        glib-networking
      ];
    };
  };

  # game packages
  environment.systemPackages = with pkgs; [
    edge.minecraft
    edge.cemu
    plutonium
    osu
    ddlc
    holocure
  ];

  # support for xbox controller usb dongle
  hardware.xone.enable = true;

}
