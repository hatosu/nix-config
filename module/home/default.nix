{

  display      = import ./display.nix;
  terminal     = import ./terminal.nix;
  browser      = import ./browser.nix;
  editor       = import ./editor.nix;
  theme        = import ./theme.nix;
  interface    = import ./interface.nix;
  fetch        = import ./fetch.nix;
  entry        = import ./entry.nix;
  message      = import ./message.nix;
  media        = import ./media.nix;
  explorer     = import ./explorer.nix;

}
