{ pkgs, ... }:
{

  environment.systemPackages =
    let
      webfish-idle = pkgs.writeShellScriptBin "webfish-idle" ''
        while :; do
          xdotool key space
          sleep 0.1
          xdotool key space
          sleep 2
          xdotool key space
          sleep 1
          xdotool key space
          sleep 0.1
          xdotool key space
          sleep 3
          xdotool key space
          sleep 4
          xdotool key 1
          sleep 2
          xdotool key space
          sleep 0.01
          xdotool key space
          sleep 0.09
          xdotool key space
          sleep 2
          xdotool key 2
          sleep 2
        done
      '';
    in
    [ webfish-idle ];

}
