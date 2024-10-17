{ config, pkgs, ... }: let icon = pkgs.writeText "logo.txt" ''
$1  \\  $2\\ //
$1 ==\\__$2\\/ $1//
$2   //   $2\\$1//
$2==//     $1//==
$2 //$1\\$2___$1//
$2// $1/\\  $2\\==
  $1// \\  $2\\
''; in { programs.fastfetch = { enable = true; package = pkgs.fastfetch; settings = {

      # logo
      logo = {
        source = "${icon}";
        padding = {
          top = 1;
        };
      };

      # visual 
      display = {
        size.binaryPrefix = "si";
        color = "white";
        separator = " ";
      };

      # modules
      modules = [
        {
          type = "os";
          format = "{2} {9}";
          key = "╭────";
        }
        {
          type = "kernel";
          format = "{1} {2}";
          key = "│ ";
        }
        {
          type = "packages";
          key = "│ ";
        }
        {
          type = "wm";
          key = "│ ";
        }
        {
          type = "terminal";
          key = "│ ";
        }
        {
          type = "cpu";
          key = "│ ";
        }
        {
          type = "gpu";
          key = "│ ";
        }
        {
          type = "disk";
          key = "│ ";
        }
        {
          type = "command";
          text = "printf '\\0'";
          key = "╰────────────────────";
        }
      ];


};};}
