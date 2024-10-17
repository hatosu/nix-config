{

  desktop        = import ./desktop.nix;
  core           = import ./core.nix;
  driver         = import ./driver.nix;
  font           = import ./font.nix;
  game           = import ./game.nix;
  manage         = import ./manage.nix;
  package        = import ./package.nix;
  secure         = import ./secure.nix;
  variable       = import ./variable.nix;
  virtualization = import ./virtualization.nix;
  login          = import ./login.nix;
  keyboard       = import ./keyboard.nix;
  init           = import ./init.nix;
  alias          = import ./alias.nix;
  function       = import ./function.nix;
  find           = import ./find.nix;
  rebuild        = import ./rebuild.nix;
  help           = import ./help.nix;
  wallpaper      = import ./wallpaper.nix;
  impermanence   = import ./impermanence.nix;

}
