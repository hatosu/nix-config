{
  pkgs,
  lib,
  ...
}: {
  # enable fonts
  fonts.packages = with pkgs;
    [
      source-code-pro
      font-awesome
      gohufont
      hack-font
      fira
      fira-mono
      fira-code
      fira-code-symbols
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
    ]
    # enable all nerd-fonts
    ++ (lib.filter lib.isDerivation (lib.attrValues pkgs.nerd-fonts));
}
