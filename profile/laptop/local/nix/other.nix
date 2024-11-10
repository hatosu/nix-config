{ pkgs, strings, ... }: {

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

}
