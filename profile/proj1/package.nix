{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    vim
    git
    alacritty
    firefox
    godot_4
  ];

}
