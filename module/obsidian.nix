{ pkgs, ... }: {

  # maybe: https://github.com/zaer1n/nix-dotfiles/blob/main/home/obsidian.nix

  home-manager.users.hatosu.home.packages = [ pkgs.obsidian ];

}
