{ pkgs, inputs, ... }: {

  # setup steam
  programs.gamemode.enable = true;
  environment.defaultPackages = with pkgs; [ pinned.mangohud ];
  programs.steam = {
    package = pkgs.latest.steam;
    enable = true;
    extraPackages = with pkgs; [ latest.gamescope ];
    extraCompatPackages = with pkgs; [ latest.proton-ge-bin ];
    protontricks.enable = true;
  };

  # game packages
  environment.systemPackages = with pkgs; [
    minecraft
    cemu
    wiiudownloader
    stable.xivlauncher
    latest.shadps4
    latest.ryujinx
  ];

  # vr
  programs.alvr = {
    package = pkgs.latest.alvr;
    enable = true;
    openFirewall = true;
  };

  # support for xbox controller usb dongle
  hardware.xone.enable = true;

}
