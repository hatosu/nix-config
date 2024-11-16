{ pkgs, ... }: {

  # enable ly
  services.displayManager.ly.enable = true;

  # create custom login prompt
  services.displayManager.sessionPackages = [
  ((pkgs.writeTextDir "share/wayland-sessions/hyprland.desktop" ''
    [Desktop Entry]
    Name=hyprland
    Comment=InsertSomeCommentHere
    Exec=${pkgs.hyprland}/bin/Hyprland
    Type=Application
  '')
  .overrideAttrs (_: {passthru.providedSessions = ["hyprland"];}))
  ];

}
