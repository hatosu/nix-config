{ config, pkgs, ...}:let

# custom login entry
window-manager = "niri";

in

{

services.displayManager.ly.enable = true;

}
