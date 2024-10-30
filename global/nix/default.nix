{

  kernel         = import ./kernel.nix;
  audio          = import ./audio.nix;
  font           = import ./font.nix;
  game           = import ./game.nix;
  virtualization = import ./virtualization.nix;
  keyboard       = import ./keyboard.nix;
  music          = import ./music.nix;

}
