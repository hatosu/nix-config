{

  terminal     = import ./terminal.nix;
  browser      = import ./browser.nix;
  editor       = import ./editor.nix;
  theme        = import ./theme.nix;
  notification = import ./notification.nix;
  utility      = import ./utility.nix;
  interface    = import ./interface.nix;
  display      = import ./display.nix;
  other        = import ./other.nix;
  entry        = import ./entry.nix;
  message      = import ./message.nix;
  media        = import ./media.nix;
  explorer     = import ./explorer.nix;

}
